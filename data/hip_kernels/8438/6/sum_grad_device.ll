; ModuleID = '../data/hip_kernels/8438/6/main.cu'
source_filename = "../data/hip_kernels/8438/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8sum_gradPfiiiiiS_iiii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = mul i32 %12, %17
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = udiv i32 %20, %17
  %25 = mul i32 %24, %17
  %26 = icmp ugt i32 %20, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %17
  %30 = icmp slt i32 %23, %5
  br i1 %30, label %31, label %36

31:                                               ; preds = %11
  %32 = icmp eq i32 %10, 0
  %33 = icmp eq i32 %10, 1
  %34 = icmp eq i32 %10, 2
  %35 = icmp eq i32 %10, 3
  br label %37

36:                                               ; preds = %78, %11
  ret void

37:                                               ; preds = %31, %78
  %38 = phi i32 [ %23, %31 ], [ %87, %78 ]
  %39 = sdiv i32 %38, %4
  %40 = mul nsw i32 %39, %4
  %41 = sub nsw i32 %38, %40
  %42 = sdiv i32 %39, %3
  %43 = mul nsw i32 %42, %3
  %44 = sub nsw i32 %39, %43
  %45 = sdiv i32 %42, %2
  %46 = mul nsw i32 %45, %2
  %47 = sub nsw i32 %42, %46
  br i1 %32, label %48, label %54

48:                                               ; preds = %37
  %49 = mul nsw i32 %47, %7
  %50 = mul nsw i32 %44, %8
  %51 = mul nsw i32 %41, %9
  %52 = add i32 %50, %51
  %53 = add i32 %52, %49
  br label %54

54:                                               ; preds = %48, %37
  %55 = phi i32 [ %53, %48 ], [ 0, %37 ]
  br i1 %33, label %56, label %62

56:                                               ; preds = %54
  %57 = mul nsw i32 %45, %7
  %58 = mul nsw i32 %44, %8
  %59 = mul nsw i32 %41, %9
  %60 = add i32 %59, %57
  %61 = add i32 %60, %58
  br label %62

62:                                               ; preds = %56, %54
  %63 = phi i32 [ %61, %56 ], [ %55, %54 ]
  br i1 %34, label %64, label %70

64:                                               ; preds = %62
  %65 = mul nsw i32 %45, %7
  %66 = mul nsw i32 %47, %8
  %67 = mul nsw i32 %41, %9
  %68 = add i32 %67, %65
  %69 = add i32 %68, %66
  br label %70

70:                                               ; preds = %64, %62
  %71 = phi i32 [ %69, %64 ], [ %63, %62 ]
  br i1 %35, label %72, label %78

72:                                               ; preds = %70
  %73 = mul nsw i32 %45, %7
  %74 = mul nsw i32 %47, %8
  %75 = mul nsw i32 %44, %9
  %76 = add i32 %75, %73
  %77 = add i32 %76, %74
  br label %78

78:                                               ; preds = %72, %70
  %79 = phi i32 [ %77, %72 ], [ %71, %70 ]
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %6, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = sext i32 %38 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %82, %85
  store float %86, float addrspace(1)* %84, align 4, !tbaa !16
  %87 = add nsw i32 %38, %29
  %88 = icmp slt i32 %87, %5
  br i1 %88, label %37, label %36, !llvm.loop !20
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
