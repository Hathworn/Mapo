; ModuleID = '../data/hip_kernels/8002/0/main.cu'
source_filename = "../data/hip_kernels/8002/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9anyMethodPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = icmp sgt i32 %13, -1
  br i1 %22, label %23, label %118

23:                                               ; preds = %4
  %24 = icmp slt i32 %13, %2
  %25 = icmp sgt i32 %21, -1
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp slt i32 %21, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %118

29:                                               ; preds = %23
  %30 = add nsw i32 %21, -1
  %31 = mul nsw i32 %30, %2
  %32 = add nsw i32 %13, -1
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i8 %36 to i32
  %38 = add nuw nsw i32 %13, 1
  %39 = add nsw i32 %31, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i8 %42 to i32
  %44 = mul nsw i32 %21, %2
  %45 = add nsw i32 %44, %32
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = zext i8 %48 to i32
  %50 = add nsw i32 %44, %38
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !amdgpu.noclobber !5
  %54 = zext i8 %53 to i32
  %55 = add nuw nsw i32 %21, 1
  %56 = mul nsw i32 %55, %2
  %57 = add nsw i32 %56, %32
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7, !amdgpu.noclobber !5
  %61 = zext i8 %60 to i32
  %62 = add nsw i32 %56, %38
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = zext i8 %65 to i32
  %67 = sub nsw i32 %54, %49
  %68 = add nuw nsw i32 %37, %61
  %69 = sub nsw i32 %43, %68
  %70 = add nsw i32 %69, %66
  %71 = add nsw i32 %56, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %72
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !7, !amdgpu.noclobber !5
  %75 = zext i8 %74 to i32
  %76 = sub nsw i32 %43, %75
  %77 = shl nsw i32 %76, 1
  %78 = add nuw nsw i32 %43, %37
  %79 = add nuw nsw i32 %61, %66
  %80 = sub nsw i32 %78, %79
  %81 = add nsw i32 %80, %77
  %82 = shl nsw i32 %67, 3
  %83 = shl nsw i32 %70, 2
  %84 = add nsw i32 %82, %83
  %85 = trunc i32 %81 to i16
  %86 = sdiv i16 %85, 5
  %87 = sitofp i32 %84 to float
  %88 = fmul contract float %87, %87
  %89 = sitofp i16 %86 to float
  %90 = fmul contract float %89, %89
  %91 = fadd contract float %88, %90
  %92 = fcmp olt float %91, 0x39F0000000000000
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %91, %93
  %95 = tail call float @llvm.sqrt.f32(float %94)
  %96 = bitcast float %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = bitcast i32 %97 to float
  %99 = add nsw i32 %96, 1
  %100 = bitcast i32 %99 to float
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 608)
  %102 = select i1 %92, float 0x3EF0000000000000, float 1.000000e+00
  %103 = fneg float %100
  %104 = tail call float @llvm.fma.f32(float %103, float %95, float %94)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = fneg float %98
  %107 = tail call float @llvm.fma.f32(float %106, float %95, float %94)
  %108 = fcmp ole float %107, 0.000000e+00
  %109 = select i1 %108, float %98, float %95
  %110 = select i1 %105, float %100, float %109
  %111 = fmul float %102, %110
  %112 = select i1 %101, float %94, float %111
  %113 = fptosi float %112 to i32
  %114 = trunc i32 %113 to i8
  %115 = add nsw i32 %44, %13
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %116
  store i8 %114, i8 addrspace(1)* %117, align 1, !tbaa !7
  br label %118

118:                                              ; preds = %29, %23, %4
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
