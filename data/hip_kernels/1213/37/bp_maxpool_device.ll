; ModuleID = '../data/hip_kernels/1213/37/main.cu'
source_filename = "../data/hip_kernels/1213/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bp_maxpoolPfS_S_S_iiiib(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i1 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = udiv i32 %18, %15
  %23 = mul i32 %22, %15
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %15
  %28 = mul i32 %6, %4
  %29 = mul i32 %28, %28
  %30 = mul i32 %29, %7
  %31 = add nsw i32 %4, -1
  %32 = sdiv i32 %31, -2
  %33 = mul nsw i32 %21, %30
  %34 = sdiv i32 %33, %27
  %35 = add nsw i32 %21, 1
  %36 = mul nsw i32 %35, %30
  %37 = sdiv i32 %36, %27
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %9
  %40 = select i1 %8, i32 %32, i32 0
  br label %42

41:                                               ; preds = %85, %9
  ret void

42:                                               ; preds = %39, %85
  %43 = phi i32 [ %96, %85 ], [ %34, %39 ]
  %44 = freeze i32 %43
  %45 = freeze i32 %4
  %46 = sdiv i32 %44, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %44, %47
  %49 = freeze i32 %4
  %50 = sdiv i32 %46, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %46, %51
  %53 = freeze i32 %7
  %54 = sdiv i32 %50, %53
  %55 = mul i32 %54, %53
  %56 = sub i32 %50, %55
  %57 = freeze i32 %6
  %58 = sdiv i32 %54, %57
  %59 = mul i32 %58, %57
  %60 = sub i32 %54, %59
  %61 = srem i32 %58, %6
  %62 = add nsw i32 %60, %48
  %63 = add nsw i32 %61, %52
  %64 = add i32 %63, %32
  %65 = add nsw i32 %61, %52
  %66 = select i1 %8, i32 %64, i32 %65
  %67 = add i32 %62, %40
  %68 = icmp sgt i32 %67, -1
  br i1 %68, label %69, label %85

69:                                               ; preds = %42
  %70 = icmp slt i32 %67, %5
  %71 = icmp sgt i32 %66, -1
  %72 = select i1 %70, i1 %71, i1 false
  %73 = icmp slt i32 %66, %5
  %74 = select i1 %72, i1 %73, i1 false
  br i1 %74, label %75, label %85

75:                                               ; preds = %69
  %76 = mul nsw i32 %56, %5
  %77 = add nsw i32 %66, %76
  %78 = mul nsw i32 %77, %5
  %79 = add nsw i32 %78, %67
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fcmp contract ogt float %82, -1.000000e+00
  %84 = select i1 %83, i32 %79, i32 0
  br label %85

85:                                               ; preds = %75, %69, %42
  %86 = phi i32 [ 0, %69 ], [ 0, %42 ], [ %84, %75 ]
  %87 = mul nsw i32 %56, %6
  %88 = add nsw i32 %61, %87
  %89 = mul nsw i32 %88, %6
  %90 = add nsw i32 %89, %60
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = sext i32 %86 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  store float %93, float addrspace(1)* %95, align 4, !tbaa !16
  %96 = add nsw i32 %43, 1
  %97 = icmp slt i32 %96, %37
  br i1 %97, label %42, label %41, !llvm.loop !20
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
