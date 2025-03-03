; ModuleID = '../data/hip_kernels/1038/1/main.cu'
source_filename = "../data/hip_kernels/1038/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17compute_iterationPcS_mmii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %4
  %25 = icmp slt i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %90

27:                                               ; preds = %6
  %28 = add nsw i32 %4, -1
  %29 = add i32 %28, %15
  %30 = srem i32 %29, %4
  %31 = add nsw i32 %15, 1
  %32 = srem i32 %31, %4
  %33 = add nsw i32 %5, -1
  %34 = add i32 %33, %23
  %35 = srem i32 %34, %5
  %36 = add nsw i32 %23, 1
  %37 = srem i32 %36, %5
  %38 = sext i32 %35 to i64
  %39 = mul i64 %38, %2
  %40 = sext i32 %30 to i64
  %41 = add i64 %39, %40
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7, !amdgpu.noclobber !5
  %44 = sext i32 %15 to i64
  %45 = add i64 %39, %44
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7, !amdgpu.noclobber !5
  %48 = add i8 %47, %43
  %49 = sext i32 %32 to i64
  %50 = add i64 %39, %49
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = add i8 %48, %52
  %54 = sext i32 %23 to i64
  %55 = mul i64 %54, %2
  %56 = add i64 %55, %40
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7, !amdgpu.noclobber !5
  %59 = add i8 %53, %58
  %60 = add i64 %55, %49
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7, !amdgpu.noclobber !5
  %63 = add i8 %59, %62
  %64 = sext i32 %37 to i64
  %65 = mul i64 %64, %2
  %66 = add i64 %65, %40
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = add i8 %63, %68
  %70 = add i64 %65, %44
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !5
  %73 = add i8 %69, %72
  %74 = add i64 %65, %49
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7, !amdgpu.noclobber !5
  %77 = add i8 %73, %76
  %78 = icmp eq i8 %77, 3
  %79 = add i64 %55, %44
  br i1 %78, label %86, label %80

80:                                               ; preds = %27
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = icmp ne i8 %82, 0
  %84 = icmp eq i8 %77, 2
  %85 = select i1 %83, i1 %84, i1 false
  br label %86

86:                                               ; preds = %27, %80
  %87 = phi i1 [ %85, %80 ], [ true, %27 ]
  %88 = zext i1 %87 to i8
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %79
  store i8 %88, i8 addrspace(1)* %89, align 1, !tbaa !7
  br label %90

90:                                               ; preds = %6, %86
  ret void
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
