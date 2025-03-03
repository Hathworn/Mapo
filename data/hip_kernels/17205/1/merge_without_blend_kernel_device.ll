; ModuleID = '../data/hip_kernels/17205/1/main.cu'
source_filename = "../data/hip_kernels/17205/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26merge_without_blend_kernelPfS_S_Piiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %9
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %52

18:                                               ; preds = %7
  %19 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = mul i32 %23, %22
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %26 = add i32 %24, %25
  %27 = and i32 %4, 3
  %28 = icmp ult i32 %4, 4
  br i1 %28, label %31, label %29

29:                                               ; preds = %18
  %30 = and i32 %4, -4
  br label %53

31:                                               ; preds = %53, %18
  %32 = phi i32 [ 0, %18 ], [ %107, %53 ]
  %33 = icmp eq i32 %27, 0
  br i1 %33, label %52, label %34

34:                                               ; preds = %31, %34
  %35 = phi i32 [ %49, %34 ], [ %32, %31 ]
  %36 = phi i32 [ %50, %34 ], [ 0, %31 ]
  %37 = mul i32 %35, %6
  %38 = add i32 %16, %37
  %39 = mul i32 %38, %5
  %40 = add i32 %26, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = icmp eq i32 %43, 0
  %45 = select i1 %44, float addrspace(1)* %1, float addrspace(1)* %0
  %46 = getelementptr inbounds float, float addrspace(1)* %45, i64 %41
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  store float %47, float addrspace(1)* %48, align 4
  %49 = add nuw nsw i32 %35, 1
  %50 = add i32 %36, 1
  %51 = icmp eq i32 %50, %27
  br i1 %51, label %52, label %34, !llvm.loop !13

52:                                               ; preds = %31, %34, %7
  ret void

53:                                               ; preds = %53, %29
  %54 = phi i32 [ 0, %29 ], [ %107, %53 ]
  %55 = phi i32 [ 0, %29 ], [ %108, %53 ]
  %56 = mul i32 %54, %6
  %57 = add i32 %16, %56
  %58 = mul i32 %57, %5
  %59 = add i32 %26, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = icmp eq i32 %62, 0
  %64 = select i1 %63, float addrspace(1)* %1, float addrspace(1)* %0
  %65 = getelementptr inbounds float, float addrspace(1)* %64, i64 %60
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !11
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %66, float addrspace(1)* %67, align 4
  %68 = or i32 %54, 1
  %69 = mul i32 %68, %6
  %70 = add i32 %16, %69
  %71 = mul i32 %70, %5
  %72 = add i32 %26, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !6
  %76 = icmp eq i32 %75, 0
  %77 = select i1 %76, float addrspace(1)* %1, float addrspace(1)* %0
  %78 = getelementptr inbounds float, float addrspace(1)* %77, i64 %73
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  store float %79, float addrspace(1)* %80, align 4
  %81 = or i32 %54, 2
  %82 = mul i32 %81, %6
  %83 = add i32 %16, %82
  %84 = mul i32 %83, %5
  %85 = add i32 %26, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = icmp eq i32 %88, 0
  %90 = select i1 %89, float addrspace(1)* %1, float addrspace(1)* %0
  %91 = getelementptr inbounds float, float addrspace(1)* %90, i64 %86
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  store float %92, float addrspace(1)* %93, align 4
  %94 = or i32 %54, 3
  %95 = mul i32 %94, %6
  %96 = add i32 %16, %95
  %97 = mul i32 %96, %5
  %98 = add i32 %26, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = icmp eq i32 %101, 0
  %103 = select i1 %102, float addrspace(1)* %1, float addrspace(1)* %0
  %104 = getelementptr inbounds float, float addrspace(1)* %103, i64 %99
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  store float %105, float addrspace(1)* %106, align 4
  %107 = add nuw nsw i32 %54, 4
  %108 = add i32 %55, 4
  %109 = icmp eq i32 %108, %30
  br i1 %109, label %31, label %53, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
