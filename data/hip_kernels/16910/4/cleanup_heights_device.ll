; ModuleID = '../data/hip_kernels/16910/4/main.cu'
source_filename = "../data/hip_kernels/16910/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E4s_id = internal addrspace(3) global [5000 x float] undef, align 16
@_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E3s_x = internal addrspace(3) global [5000 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15cleanup_heightsPKdPKfPKiS4_PiS5_S5_(double addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = tail call i32 @llvm.smin.i32(i32 %10, i32 5000)
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %15, label %13

13:                                               ; preds = %7
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %35

15:                                               ; preds = %7
  %16 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  br label %19

19:                                               ; preds = %15, %19
  %20 = phi i32 [ %8, %15 ], [ %33, %19 ]
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !10, !amdgpu.noclobber !9
  %24 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E3s_x, i32 0, i32 %20
  %25 = addrspacecast float addrspace(3)* %24 to float*
  store volatile float %23, float* %25, align 4, !tbaa !10
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %21
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = sitofp i32 %27 to float
  %29 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E4s_id, i32 0, i32 %20
  %30 = addrspacecast float addrspace(3)* %29 to float*
  store volatile float %28, float* %30, align 4, !tbaa !10
  %31 = load i16, i16 addrspace(4)* %18, align 4, !range !12, !invariant.load !9
  %32 = zext i16 %31 to i32
  %33 = add i32 %20, %32
  %34 = icmp slt i32 %33, %11
  br i1 %34, label %19, label %35, !llvm.loop !13

35:                                               ; preds = %19, %13
  %36 = phi i8 addrspace(4)* [ %14, %13 ], [ %16, %19 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = getelementptr i8, i8 addrspace(4)* %36, i64 4
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 4, !range !12, !invariant.load !9
  %40 = zext i16 %39 to i32
  %41 = mul i32 %9, %40
  %42 = add i32 %41, %8
  %43 = icmp slt i32 %42, %11
  br i1 %43, label %44, label %86

44:                                               ; preds = %35
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E3s_x, i32 0, i32 %42
  %47 = addrspacecast float addrspace(3)* %46 to float*
  %48 = load volatile float, float* %47, align 4, !tbaa !10
  %49 = icmp sgt i32 %10, 0
  br i1 %49, label %50, label %72

50:                                               ; preds = %44
  %51 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E4s_id, i32 0, i32 %42
  %52 = addrspacecast float addrspace(3)* %51 to float*
  %53 = tail call i32 @llvm.smax.i32(i32 %11, i32 1)
  br label %54

54:                                               ; preds = %50, %69
  %55 = phi i32 [ 0, %50 ], [ %70, %69 ]
  %56 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E4s_id, i32 0, i32 %55
  %57 = addrspacecast float addrspace(3)* %56 to float*
  %58 = load volatile float, float* %57, align 4, !tbaa !10
  %59 = load volatile float, float* %52, align 4, !tbaa !10
  %60 = fsub contract float %58, %59
  %61 = tail call float @llvm.fabs.f32(float %60)
  %62 = fptosi float %61 to i32
  %63 = icmp slt i32 %62, 5
  br i1 %63, label %64, label %69

64:                                               ; preds = %54
  %65 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E3s_x, i32 0, i32 %55
  %66 = addrspacecast float addrspace(3)* %65 to float*
  %67 = load volatile float, float* %66, align 4, !tbaa !10
  %68 = fcmp contract olt float %48, %67
  br i1 %68, label %86, label %69

69:                                               ; preds = %54, %64
  %70 = add nuw nsw i32 %55, 1
  %71 = icmp eq i32 %70, %53
  br i1 %71, label %72, label %54, !llvm.loop !15

72:                                               ; preds = %69, %44
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 1
  %74 = atomicrmw add i32 addrspace(1)* %73, i32 1 syncscope("agent-one-as") monotonic, align 4
  %75 = icmp slt i32 %74, 5000
  br i1 %75, label %76, label %86

76:                                               ; preds = %72
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5
  %79 = sext i32 %74 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %79
  store i32 %78, i32 addrspace(1)* %80, align 4, !tbaa !5
  %81 = getelementptr inbounds [5000 x float], [5000 x float] addrspace(3)* @_ZZ15cleanup_heightsPKdPKfPKiS4_PiS5_S5_E4s_id, i32 0, i32 %42
  %82 = addrspacecast float addrspace(3)* %81 to float*
  %83 = load volatile float, float* %82, align 4, !tbaa !10
  %84 = fptosi float %83 to i32
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %79
  store i32 %84, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %64, %76, %72, %35
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
