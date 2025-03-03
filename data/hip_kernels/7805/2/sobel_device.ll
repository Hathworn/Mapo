; ModuleID = '../data/hip_kernels/7805/2/main.cu'
source_filename = "../data/hip_kernels/7805/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5sobelPhS_ii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = icmp slt i32 %21, %3
  %23 = icmp slt i32 %13, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %130

25:                                               ; preds = %4
  %26 = add nsw i32 %13, -1
  %27 = add nsw i32 %21, -1
  %28 = mul nsw i32 %27, %2
  %29 = add nsw i32 %26, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !5
  %33 = uitofp i8 %32 to float
  %34 = fsub contract float 0.000000e+00, %33
  %35 = add nsw i32 %13, %28
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = uitofp i8 %38 to float
  %40 = fmul contract float %39, -2.000000e+00
  %41 = fadd contract float %34, %40
  %42 = fmul contract float %39, 0.000000e+00
  %43 = fadd contract float %34, %42
  %44 = add nsw i32 %13, 1
  %45 = add nsw i32 %44, %28
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = uitofp i8 %48 to float
  %50 = fsub contract float %41, %49
  %51 = fadd contract float %43, %49
  %52 = mul nsw i32 %21, %2
  %53 = add nsw i32 %26, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !5
  %57 = uitofp i8 %56 to float
  %58 = fmul contract float %57, 0.000000e+00
  %59 = fadd contract float %50, %58
  %60 = fmul contract float %57, -2.000000e+00
  %61 = fadd contract float %51, %60
  %62 = add nsw i32 %13, %52
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = uitofp i8 %65 to float
  %67 = fmul contract float %66, 0.000000e+00
  %68 = fadd contract float %59, %67
  %69 = fadd contract float %61, %67
  %70 = add nsw i32 %44, %52
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7, !amdgpu.noclobber !5
  %74 = uitofp i8 %73 to float
  %75 = fmul contract float %74, 0.000000e+00
  %76 = fadd contract float %68, %75
  %77 = fmul contract float %74, 2.000000e+00
  %78 = fadd contract float %69, %77
  %79 = add nsw i32 %21, 1
  %80 = mul nsw i32 %79, %2
  %81 = add nsw i32 %26, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %82
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !7, !amdgpu.noclobber !5
  %85 = uitofp i8 %84 to float
  %86 = fadd contract float %76, %85
  %87 = fsub contract float %78, %85
  %88 = add nsw i32 %13, %80
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %89
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !7, !amdgpu.noclobber !5
  %92 = uitofp i8 %91 to float
  %93 = fmul contract float %92, 2.000000e+00
  %94 = fadd contract float %86, %93
  %95 = fmul contract float %92, 0.000000e+00
  %96 = fadd contract float %87, %95
  %97 = add nsw i32 %44, %80
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7, !amdgpu.noclobber !5
  %101 = uitofp i8 %100 to float
  %102 = fadd contract float %94, %101
  %103 = fadd contract float %96, %101
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %105 = fmul contract float %102, %102
  %106 = fmul contract float %103, %103
  %107 = fadd contract float %106, %105
  %108 = fcmp olt float %107, 0x39F0000000000000
  %109 = select i1 %108, float 0x41F0000000000000, float 1.000000e+00
  %110 = fmul float %107, %109
  %111 = tail call float @llvm.sqrt.f32(float %110)
  %112 = bitcast float %111 to i32
  %113 = add nsw i32 %112, -1
  %114 = bitcast i32 %113 to float
  %115 = add nsw i32 %112, 1
  %116 = bitcast i32 %115 to float
  %117 = tail call i1 @llvm.amdgcn.class.f32(float %110, i32 608)
  %118 = select i1 %108, float 0x3EF0000000000000, float 1.000000e+00
  %119 = fneg float %116
  %120 = tail call float @llvm.fma.f32(float %119, float %111, float %110)
  %121 = fcmp ogt float %120, 0.000000e+00
  %122 = fneg float %114
  %123 = tail call float @llvm.fma.f32(float %122, float %111, float %110)
  %124 = fcmp ole float %123, 0.000000e+00
  %125 = select i1 %124, float %114, float %111
  %126 = select i1 %121, float %116, float %125
  %127 = fmul float %118, %126
  %128 = select i1 %117, float %110, float %127
  %129 = fptoui float %128 to i8
  store i8 %129, i8 addrspace(1)* %104, align 1, !tbaa !7
  br label %130

130:                                              ; preds = %4, %25
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
