; ModuleID = '../data/hip_kernels/1/15/main.cu'
source_filename = "../data/hip_kernels/1/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10gpuFindMaxiPfiPiE11maxIndicies = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10gpuFindMaxiPfiPi(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul i32 %5, %2
  %7 = add nsw i32 %6, %2
  %8 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ10gpuFindMaxiPfiPiE11maxIndicies, i32 0, i32 %5
  store i32 -1, i32 addrspace(3)* %8, align 4, !tbaa !5
  %9 = icmp slt i32 %6, %0
  br i1 %9, label %10, label %66

10:                                               ; preds = %4
  %11 = add nsw i32 %6, 1
  %12 = icmp sgt i32 %2, 1
  %13 = icmp slt i32 %11, %0
  %14 = select i1 %12, i1 %13, i1 false
  br i1 %14, label %15, label %30

15:                                               ; preds = %10, %15
  %16 = phi i32 [ %26, %15 ], [ %11, %10 ]
  %17 = phi i32 [ %25, %15 ], [ %6, %10 ]
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !9, !amdgpu.noclobber !11
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !9, !amdgpu.noclobber !11
  %24 = fcmp contract ogt float %20, %23
  %25 = select i1 %24, i32 %16, i32 %17
  %26 = add nsw i32 %16, 1
  %27 = icmp slt i32 %26, %7
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %15, label %30, !llvm.loop !12

30:                                               ; preds = %15, %10
  %31 = phi i32 [ %6, %10 ], [ %25, %15 ]
  store i32 %31, i32 addrspace(3)* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %33 = getelementptr i8, i8 addrspace(4)* %32, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !14, !invariant.load !11
  %36 = icmp ult i16 %35, 2
  br i1 %36, label %39, label %37

37:                                               ; preds = %30
  %38 = zext i16 %35 to i32
  br label %41

39:                                               ; preds = %62, %30
  %40 = icmp eq i32 %5, 0
  br i1 %40, label %64, label %66

41:                                               ; preds = %37, %62
  %42 = phi i32 [ %43, %62 ], [ %38, %37 ]
  %43 = lshr i32 %42, 1
  %44 = icmp ult i32 %5, %43
  br i1 %44, label %45, label %62

45:                                               ; preds = %41
  %46 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %47 = add nuw nsw i32 %43, %5
  %48 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ10gpuFindMaxiPfiPiE11maxIndicies, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %50 = icmp ne i32 %46, -1
  %51 = icmp ne i32 %49, -1
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %53, label %62

53:                                               ; preds = %45
  %54 = sext i32 %46 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !9, !amdgpu.noclobber !11
  %57 = sext i32 %49 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !9, !amdgpu.noclobber !11
  %60 = fcmp contract olt float %56, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %53
  store i32 %49, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %45, %53, %61, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %42, 4
  br i1 %63, label %39, label %41, !llvm.loop !15

64:                                               ; preds = %39
  %65 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ10gpuFindMaxiPfiPiE11maxIndicies, i32 0, i32 0), align 16, !tbaa !5
  store i32 %65, i32 addrspace(1)* %3, align 4, !tbaa !5
  br label %66

66:                                               ; preds = %39, %64, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = !{}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{i16 1, i16 1025}
!15 = distinct !{!15, !13}
