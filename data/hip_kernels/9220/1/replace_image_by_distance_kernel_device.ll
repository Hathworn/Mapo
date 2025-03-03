; ModuleID = '../data/hip_kernels/9220/1/main.cu'
source_filename = "../data/hip_kernels/9220/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z32replace_image_by_distance_kernelPKhPKfS0_Phfjjj(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, float %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp ult i32 %25, %6
  %27 = icmp ult i32 %17, %5
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %90

29:                                               ; preds = %8
  %30 = mul i32 %25, %5
  %31 = add i32 %30, %17
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = mul i32 %31, 3
  %36 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 504)
  %37 = fcmp contract ogt float %34, %4
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %52

39:                                               ; preds = %29
  %40 = sext i32 %35 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !11, !amdgpu.noclobber !5
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %40
  store i8 %42, i8 addrspace(1)* %43, align 1, !tbaa !11
  %44 = add nsw i32 %35, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !11
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %45
  store i8 %47, i8 addrspace(1)* %48, align 1, !tbaa !11
  %49 = add nsw i32 %35, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %50
  br label %85

52:                                               ; preds = %29
  %53 = icmp eq i32 %7, 1
  br i1 %53, label %54, label %66

54:                                               ; preds = %52
  %55 = sext i32 %31 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !11, !amdgpu.noclobber !5
  %58 = sext i32 %35 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %58
  store i8 %57, i8 addrspace(1)* %59, align 1, !tbaa !11
  %60 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !11
  %61 = add nsw i32 %35, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %62
  store i8 %60, i8 addrspace(1)* %63, align 1, !tbaa !11
  %64 = add nsw i32 %35, 2
  %65 = sext i32 %64 to i64
  br label %85

66:                                               ; preds = %52
  %67 = mul i32 %31, %7
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %68
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !11, !amdgpu.noclobber !5
  %71 = sext i32 %35 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %71
  store i8 %70, i8 addrspace(1)* %72, align 1, !tbaa !11
  %73 = add nsw i32 %67, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !11
  %77 = add nsw i32 %35, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %78
  store i8 %76, i8 addrspace(1)* %79, align 1, !tbaa !11
  %80 = add nsw i32 %67, 2
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %81
  %83 = add nsw i32 %35, 2
  %84 = sext i32 %83 to i64
  br label %85

85:                                               ; preds = %54, %66, %39
  %86 = phi i64 [ %50, %39 ], [ %84, %66 ], [ %65, %54 ]
  %87 = phi i8 addrspace(1)* [ %51, %39 ], [ %82, %66 ], [ %56, %54 ]
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !11
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %86
  store i8 %88, i8 addrspace(1)* %89, align 1, !tbaa !11
  br label %90

90:                                               ; preds = %85, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
