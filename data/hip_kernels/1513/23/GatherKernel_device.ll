; ModuleID = '../data/hip_kernels/1513/23/main.cu'
source_filename = "../data/hip_kernels/1513/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shmem_indices = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12GatherKernelPKfliiiPKlPf(float addrspace(1)* nocapture readonly %0, i64 %1, i32 %2, i32 %3, i32 %4, i64 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp slt i32 %8, %4
  br i1 %10, label %11, label %18

11:                                               ; preds = %7
  %12 = mul nsw i32 %9, %4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  br label %28

18:                                               ; preds = %28, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp sgt i32 %4, 0
  br i1 %19, label %20, label %54

20:                                               ; preds = %18
  %21 = sext i32 %2 to i64
  %22 = zext i32 %8 to i64
  %23 = mul nsw i32 %9, %4
  %24 = and i32 %4, 1
  %25 = icmp eq i32 %4, 1
  br i1 %25, label %38, label %26

26:                                               ; preds = %20
  %27 = and i32 %4, -2
  br label %55

28:                                               ; preds = %11, %28
  %29 = phi i32 [ %8, %11 ], [ %36, %28 ]
  %30 = add nsw i32 %29, %12
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %31
  %33 = load i64, i64 addrspace(1)* %32, align 8, !tbaa !7, !amdgpu.noclobber !6
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %29
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !11
  %36 = add i32 %29, %17
  %37 = icmp slt i32 %36, %4
  br i1 %37, label %28, label %18, !llvm.loop !13

38:                                               ; preds = %55, %20
  %39 = phi i32 [ 0, %20 ], [ %83, %55 ]
  %40 = icmp eq i32 %24, 0
  br i1 %40, label %54, label %41

41:                                               ; preds = %38
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %39
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !11
  %44 = sext i32 %43 to i64
  %45 = mul nsw i64 %44, %21
  %46 = add nsw i64 %45, %22
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !15
  %49 = add nsw i32 %39, %23
  %50 = mul nsw i32 %49, %2
  %51 = add nsw i32 %50, %8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %6, i64 %52
  store float %48, float addrspace(1)* %53, align 4, !tbaa !15
  br label %54

54:                                               ; preds = %41, %38, %18
  ret void

55:                                               ; preds = %55, %26
  %56 = phi i32 [ 0, %26 ], [ %83, %55 ]
  %57 = phi i32 [ 0, %26 ], [ %84, %55 ]
  %58 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %56
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !11
  %60 = sext i32 %59 to i64
  %61 = mul nsw i64 %60, %21
  %62 = add nsw i64 %61, %22
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !15
  %65 = add nsw i32 %56, %23
  %66 = mul nsw i32 %65, %2
  %67 = add nsw i32 %66, %8
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %6, i64 %68
  store float %64, float addrspace(1)* %69, align 4, !tbaa !15
  %70 = or i32 %56, 1
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shmem_indices, i32 0, i32 %70
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !11
  %73 = sext i32 %72 to i64
  %74 = mul nsw i64 %73, %21
  %75 = add nsw i64 %74, %22
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !15
  %78 = add nsw i32 %70, %23
  %79 = mul nsw i32 %78, %2
  %80 = add nsw i32 %79, %8
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %6, i64 %81
  store float %77, float addrspace(1)* %82, align 4, !tbaa !15
  %83 = add nuw nsw i32 %56, 2
  %84 = add i32 %57, 2
  %85 = icmp eq i32 %84, %27
  br i1 %85, label %38, label %55, !llvm.loop !17
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
