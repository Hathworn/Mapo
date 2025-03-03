; ModuleID = '../data/hip_kernels/14484/2/main.cu'
source_filename = "../data/hip_kernels/14484/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12max_min_cudaPfS_S_S_m(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %11
  %17 = add i32 %16, %6
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, -1
  %23 = add i32 %22, %21
  %24 = icmp eq i32 %15, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %5
  %26 = zext i16 %10 to i64
  %27 = urem i64 %4, %26
  %28 = trunc i64 %27 to i32
  br label %29

29:                                               ; preds = %5, %25
  %30 = phi i32 [ %28, %25 ], [ %11, %5 ]
  %31 = icmp ult i16 %10, 2
  br i1 %31, label %39, label %32

32:                                               ; preds = %29
  %33 = lshr i32 %11, 1
  %34 = zext i32 %33 to i64
  %35 = sext i32 %17 to i64
  %36 = zext i32 %6 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  br label %41

39:                                               ; preds = %82, %29
  %40 = icmp eq i32 %6, 0
  br i1 %40, label %86, label %95

41:                                               ; preds = %32, %82
  %42 = phi i64 [ %34, %32 ], [ %84, %82 ]
  %43 = phi i32 [ %30, %32 ], [ %83, %82 ]
  %44 = add nsw i64 %42, %35
  %45 = icmp ult i64 %44, %4
  %46 = icmp ugt i64 %42, %36
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %82

48:                                               ; preds = %41
  %49 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fcmp contract ogt float %49, %51
  %53 = select contract i1 %52, float %49, float %51
  store float %53, float addrspace(1)* %37, align 4, !tbaa !16
  %54 = and i32 %43, -2147483647
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %66

56:                                               ; preds = %48
  %57 = add nsw i64 %44, %42
  %58 = add nsw i32 %43, -1
  %59 = zext i32 %58 to i64
  %60 = icmp eq i64 %57, %59
  br i1 %60, label %61, label %66

61:                                               ; preds = %56
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = fcmp contract ogt float %53, %63
  %65 = select contract i1 %64, float %53, float %63
  store float %65, float addrspace(1)* %37, align 4, !tbaa !16
  br label %66

66:                                               ; preds = %61, %56, %48
  %67 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fcmp contract olt float %67, %69
  %71 = select contract i1 %70, float %67, float %69
  store float %71, float addrspace(1)* %38, align 4, !tbaa !16
  br i1 %55, label %72, label %82

72:                                               ; preds = %66
  %73 = add nsw i64 %44, %42
  %74 = add nsw i32 %43, -1
  %75 = zext i32 %74 to i64
  %76 = icmp eq i64 %73, %75
  br i1 %76, label %77, label %82

77:                                               ; preds = %72
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fcmp contract olt float %71, %79
  %81 = select contract i1 %80, float %71, float %79
  store float %81, float addrspace(1)* %38, align 4, !tbaa !16
  br label %82

82:                                               ; preds = %66, %72, %77, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = sdiv i32 %43, 2
  %84 = lshr i64 %42, 1
  %85 = icmp ult i64 %42, 2
  br i1 %85, label %39, label %41, !llvm.loop !20

86:                                               ; preds = %39
  %87 = sext i32 %17 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = zext i32 %15 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  store float %89, float addrspace(1)* %91, align 4, !tbaa !16
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %90
  store float %93, float addrspace(1)* %94, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %86, %39
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
