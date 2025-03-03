; ModuleID = '../data/hip_kernels/14393/2/main.cu'
source_filename = "../data/hip_kernels/14393/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18sobelfilter_kerneliiPhS_(i32 %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %13, 0
  br i1 %22, label %23, label %122

23:                                               ; preds = %4
  %24 = add nsw i32 %0, -1
  %25 = icmp slt i32 %13, %24
  %26 = icmp sgt i32 %21, 0
  %27 = select i1 %25, i1 %26, i1 false
  %28 = add nsw i32 %1, -1
  %29 = icmp slt i32 %21, %28
  %30 = select i1 %27, i1 %29, i1 false
  br i1 %30, label %31, label %122

31:                                               ; preds = %23
  %32 = add nsw i32 %21, -1
  %33 = mul nsw i32 %32, %0
  %34 = add nsw i32 %13, -1
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i8 %38 to i32
  %40 = add nuw nsw i32 %13, 1
  %41 = add nsw i32 %33, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = mul nsw i32 %21, %0
  %47 = add nsw i32 %46, %34
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i8 %50 to i32
  %52 = add nsw i32 %46, %40
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = zext i8 %55 to i32
  %57 = add nuw nsw i32 %21, 1
  %58 = mul nsw i32 %57, %0
  %59 = add nsw i32 %58, %34
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i8 %62 to i32
  %64 = add nsw i32 %58, %40
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i8 %67 to i32
  %69 = sub nsw i32 %56, %51
  %70 = shl nsw i32 %69, 1
  %71 = add nuw nsw i32 %39, %63
  %72 = sub nsw i32 %45, %71
  %73 = add nsw i32 %72, %68
  %74 = add nsw i32 %73, %70
  %75 = add nsw i32 %33, %13
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = zext i8 %78 to i32
  %80 = add nsw i32 %58, %13
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7, !amdgpu.noclobber !5
  %84 = zext i8 %83 to i32
  %85 = sub nsw i32 %84, %79
  %86 = shl nsw i32 %85, 1
  %87 = add nuw nsw i32 %45, %39
  %88 = sub nsw i32 %63, %87
  %89 = add nsw i32 %88, %68
  %90 = add nsw i32 %89, %86
  %91 = sitofp i32 %74 to float
  %92 = fmul contract float %91, %91
  %93 = sitofp i32 %90 to float
  %94 = fmul contract float %93, %93
  %95 = fadd contract float %92, %94
  %96 = fcmp olt float %95, 0x39F0000000000000
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %95, %97
  %99 = tail call float @llvm.sqrt.f32(float %98)
  %100 = bitcast float %99 to i32
  %101 = add nsw i32 %100, -1
  %102 = bitcast i32 %101 to float
  %103 = add nsw i32 %100, 1
  %104 = bitcast i32 %103 to float
  %105 = tail call i1 @llvm.amdgcn.class.f32(float %98, i32 608)
  %106 = select i1 %96, float 0x3EF0000000000000, float 1.000000e+00
  %107 = fneg float %104
  %108 = tail call float @llvm.fma.f32(float %107, float %99, float %98)
  %109 = fcmp ogt float %108, 0.000000e+00
  %110 = fneg float %102
  %111 = tail call float @llvm.fma.f32(float %110, float %99, float %98)
  %112 = fcmp ole float %111, 0.000000e+00
  %113 = select i1 %112, float %102, float %99
  %114 = select i1 %109, float %104, float %113
  %115 = fmul float %106, %114
  %116 = select i1 %105, float %98, float %115
  %117 = fptosi float %116 to i32
  %118 = trunc i32 %117 to i8
  %119 = add nsw i32 %46, %13
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %120
  store i8 %118, i8 addrspace(1)* %121, align 1, !tbaa !7
  br label %122

122:                                              ; preds = %31, %23, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
