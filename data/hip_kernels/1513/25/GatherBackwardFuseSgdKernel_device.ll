; ModuleID = '../data/hip_kernels/1513/25/main.cu'
source_filename = "../data/hip_kernels/1513/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shmem_indices = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27GatherBackwardFuseSgdKernelPKfliiiPKlfPf(float addrspace(1)* nocapture readonly %0, i64 %1, i32 %2, i32 %3, i32 %4, i64 addrspace(1)* nocapture readonly %5, float %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp slt i32 %9, %4
  br i1 %11, label %12, label %19

12:                                               ; preds = %8
  %13 = mul nsw i32 %10, %4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  br label %30

19:                                               ; preds = %30, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp sgt i32 %4, 0
  br i1 %20, label %21, label %58

21:                                               ; preds = %19
  %22 = sext i32 %2 to i64
  %23 = zext i32 %9 to i64
  %24 = fneg contract float %6
  %25 = mul nsw i32 %10, %4
  %26 = and i32 %4, 1
  %27 = icmp eq i32 %4, 1
  br i1 %27, label %40, label %28

28:                                               ; preds = %21
  %29 = and i32 %4, -2
  br label %59

30:                                               ; preds = %12, %30
  %31 = phi i32 [ %9, %12 ], [ %38, %30 ]
  %32 = add nsw i32 %31, %13
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %33
  %35 = load i64, i64 addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = trunc i64 %35 to i32
  %37 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %31
  store i32 %36, i32 addrspace(3)* %37, align 4, !tbaa !11
  %38 = add i32 %31, %18
  %39 = icmp slt i32 %38, %4
  br i1 %39, label %30, label %19, !llvm.loop !13

40:                                               ; preds = %59, %21
  %41 = phi i32 [ 0, %21 ], [ %91, %59 ]
  %42 = icmp eq i32 %26, 0
  br i1 %42, label %58, label %43

43:                                               ; preds = %40
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %41
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !11
  %46 = sext i32 %45 to i64
  %47 = mul nsw i64 %46, %22
  %48 = add nsw i64 %47, %23
  %49 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  %50 = add nsw i32 %41, %25
  %51 = mul nsw i32 %50, %2
  %52 = add nsw i32 %51, %9
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !15
  %56 = fmul contract float %55, %24
  %57 = atomicrmw fadd float addrspace(1)* %49, float %56 syncscope("agent-one-as") monotonic, align 4
  br label %58

58:                                               ; preds = %43, %40, %19
  ret void

59:                                               ; preds = %59, %28
  %60 = phi i32 [ 0, %28 ], [ %91, %59 ]
  %61 = phi i32 [ 0, %28 ], [ %92, %59 ]
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %60
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !11
  %64 = sext i32 %63 to i64
  %65 = mul nsw i64 %64, %22
  %66 = add nsw i64 %65, %23
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %66
  %68 = add nsw i32 %60, %25
  %69 = mul nsw i32 %68, %2
  %70 = add nsw i32 %69, %9
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !15
  %74 = fmul contract float %73, %24
  %75 = atomicrmw fadd float addrspace(1)* %67, float %74 syncscope("agent-one-as") monotonic, align 4
  %76 = or i32 %60, 1
  %77 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !11
  %79 = sext i32 %78 to i64
  %80 = mul nsw i64 %79, %22
  %81 = add nsw i64 %80, %23
  %82 = getelementptr inbounds float, float addrspace(1)* %7, i64 %81
  %83 = add nsw i32 %76, %25
  %84 = mul nsw i32 %83, %2
  %85 = add nsw i32 %84, %9
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !15
  %89 = fmul contract float %88, %24
  %90 = atomicrmw fadd float addrspace(1)* %82, float %89 syncscope("agent-one-as") monotonic, align 4
  %91 = add nuw nsw i32 %60, 2
  %92 = add i32 %61, 2
  %93 = icmp eq i32 %92, %29
  br i1 %93, label %40, label %59, !llvm.loop !17
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !9, i64 0}
!17 = distinct !{!17, !14, !18}
!18 = !{!"llvm.loop.unroll.disable"}
