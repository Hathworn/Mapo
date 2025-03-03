; ModuleID = '../data/hip_kernels/5453/57/main.cu'
source_filename = "../data/hip_kernels/5453/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kCorrelatePfS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = mul nsw i32 %4, %3
  %27 = icmp ult i32 %19, %26
  br i1 %27, label %28, label %37

28:                                               ; preds = %7
  %29 = sdiv i32 %5, -2
  %30 = sdiv i32 %5, 2
  %31 = icmp sgt i32 %29, %30
  %32 = sdiv i32 %6, -2
  %33 = sdiv i32 %6, 2
  %34 = icmp sgt i32 %32, %33
  %35 = mul nsw i32 %6, %5
  %36 = sdiv i32 %35, 2
  br label %38

37:                                               ; preds = %40, %7
  ret void

38:                                               ; preds = %28, %40
  %39 = phi i32 [ %19, %28 ], [ %44, %40 ]
  br i1 %31, label %40, label %46

40:                                               ; preds = %62, %38
  %41 = phi float [ 0.000000e+00, %38 ], [ %63, %62 ]
  %42 = zext i32 %39 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  store float %41, float addrspace(1)* %43, align 4, !tbaa !16
  %44 = add i32 %39, %25
  %45 = icmp ult i32 %44, %26
  br i1 %45, label %38, label %37, !llvm.loop !20

46:                                               ; preds = %38, %62
  %47 = phi float [ %63, %62 ], [ 0.000000e+00, %38 ]
  %48 = phi i32 [ %64, %62 ], [ %29, %38 ]
  br i1 %34, label %62, label %49

49:                                               ; preds = %46
  %50 = freeze i32 %39
  %51 = freeze i32 %4
  %52 = udiv i32 %50, %51
  %53 = add i32 %52, %48
  %54 = mul i32 %52, %51
  %55 = sub i32 %50, %54
  %56 = mul nsw i32 %48, %4
  %57 = add i32 %56, %39
  %58 = icmp sgt i32 %53, -1
  %59 = icmp slt i32 %53, %3
  %60 = mul nsw i32 %48, %6
  %61 = add nsw i32 %60, %36
  br label %66

62:                                               ; preds = %86, %46
  %63 = phi float [ %47, %46 ], [ %87, %86 ]
  %64 = add nsw i32 %48, 1
  %65 = icmp slt i32 %48, %30
  br i1 %65, label %46, label %40, !llvm.loop !22

66:                                               ; preds = %49, %86
  %67 = phi float [ %47, %49 ], [ %87, %86 ]
  %68 = phi i32 [ %32, %49 ], [ %88, %86 ]
  %69 = add i32 %55, %68
  %70 = add i32 %57, %68
  br i1 %58, label %71, label %86

71:                                               ; preds = %66
  %72 = icmp sgt i32 %69, -1
  %73 = select i1 %59, i1 %72, i1 false
  %74 = icmp slt i32 %69, %4
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %86

76:                                               ; preds = %71
  %77 = sext i32 %70 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = add nsw i32 %61, %68
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %67, %84
  br label %86

86:                                               ; preds = %76, %71, %66
  %87 = phi float [ %85, %76 ], [ %67, %71 ], [ %67, %66 ]
  %88 = add nsw i32 %68, 1
  %89 = icmp slt i32 %68, %33
  br i1 %89, label %66, label %62, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
