; ModuleID = '../data/hip_kernels/14012/26/main.cu'
source_filename = "../data/hip_kernels/14012/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26gpu_copyPredictorTo24ShiftPiPtPhjPjiij(i32 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = and i32 %9, 7
  %11 = lshr i32 %9, 3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul nuw nsw i32 %10, %17
  %19 = add nuw nsw i32 %18, %12
  %20 = zext i32 %11 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = icmp ult i32 %19, %22
  br i1 %23, label %24, label %54

24:                                               ; preds = %8
  %25 = mul nsw i32 %11, %6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %26
  %28 = shl nsw i32 %5, 3
  %29 = mul i32 %11, %7
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = zext i32 %19 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %31, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = shl i32 %34, %28
  %36 = shl i32 %29, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %37
  %39 = getelementptr inbounds i16, i16 addrspace(1)* %38, i64 %32
  %40 = load i16, i16 addrspace(1)* %39, align 2, !tbaa !11, !amdgpu.noclobber !6
  %41 = zext i16 %40 to i32
  %42 = or i32 %35, %41
  %43 = mul i32 %3, 3
  %44 = mul i32 %43, %19
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 %45
  %47 = lshr i32 %35, 16
  %48 = trunc i32 %47 to i8
  store i8 %48, i8 addrspace(1)* %46, align 1, !tbaa !13
  %49 = lshr i32 %42, 8
  %50 = trunc i32 %49 to i8
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %46, i64 1
  store i8 %50, i8 addrspace(1)* %51, align 1, !tbaa !13
  %52 = trunc i32 %42 to i8
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %46, i64 2
  store i8 %52, i8 addrspace(1)* %53, align 1, !tbaa !13
  br label %54

54:                                               ; preds = %24, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !9, i64 0}
!13 = !{!9, !9, i64 0}
