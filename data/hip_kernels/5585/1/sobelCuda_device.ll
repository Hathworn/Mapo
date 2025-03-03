; ModuleID = '../data/hip_kernels/5585/1/main.cu'
source_filename = "../data/hip_kernels/5585/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9sobelCudaPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = freeze i32 %13
  %15 = freeze i32 %2
  %16 = sdiv i32 %14, %15
  %17 = mul i32 %16, %15
  %18 = sub i32 %14, %17
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %120, label %20

20:                                               ; preds = %4
  %21 = add nsw i32 %2, -1
  %22 = icmp slt i32 %18, %21
  %23 = icmp sgt i32 %16, 0
  %24 = and i1 %23, %22
  %25 = add nsw i32 %3, -1
  %26 = icmp slt i32 %16, %25
  %27 = select i1 %24, i1 %26, i1 false
  br i1 %27, label %28, label %120

28:                                               ; preds = %20
  %29 = add nsw i32 %18, -1
  %30 = add nsw i32 %16, -1
  %31 = mul nsw i32 %30, %2
  %32 = add nsw i32 %29, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !6
  %36 = zext i8 %35 to i32
  %37 = add nsw i32 %31, %18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !6
  %41 = zext i8 %40 to i32
  %42 = add nuw nsw i32 %18, 1
  %43 = add nsw i32 %42, %31
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !6
  %47 = zext i8 %46 to i32
  %48 = add nuw nsw i32 %16, 1
  %49 = mul nsw i32 %48, %2
  %50 = add nsw i32 %29, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !amdgpu.noclobber !6
  %54 = zext i8 %53 to i32
  %55 = add nsw i32 %49, %18
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7, !amdgpu.noclobber !6
  %59 = zext i8 %58 to i32
  %60 = add nsw i32 %42, %49
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7, !amdgpu.noclobber !6
  %64 = zext i8 %63 to i32
  %65 = sub nsw i32 %59, %41
  %66 = shl nsw i32 %65, 1
  %67 = add nuw nsw i32 %47, %36
  %68 = sub nsw i32 %54, %67
  %69 = add nsw i32 %68, %64
  %70 = add nsw i32 %69, %66
  %71 = mul nsw i32 %16, %2
  %72 = add nsw i32 %29, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7, !amdgpu.noclobber !6
  %76 = zext i8 %75 to i32
  %77 = add nsw i32 %42, %71
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7, !amdgpu.noclobber !6
  %81 = zext i8 %80 to i32
  %82 = sub nsw i32 %81, %76
  %83 = shl nsw i32 %82, 1
  %84 = add nuw nsw i32 %36, %54
  %85 = sub nsw i32 %47, %84
  %86 = add nsw i32 %85, %64
  %87 = add nsw i32 %86, %83
  %88 = mul nsw i32 %70, %70
  %89 = sitofp i32 %88 to float
  %90 = mul nsw i32 %87, %87
  %91 = sitofp i32 %90 to float
  %92 = fadd contract float %89, %91
  %93 = fcmp olt float %92, 0x39F0000000000000
  %94 = select i1 %93, float 0x41F0000000000000, float 1.000000e+00
  %95 = fmul float %92, %94
  %96 = tail call float @llvm.sqrt.f32(float %95)
  %97 = bitcast float %96 to i32
  %98 = add nsw i32 %97, -1
  %99 = bitcast i32 %98 to float
  %100 = add nsw i32 %97, 1
  %101 = bitcast i32 %100 to float
  %102 = tail call i1 @llvm.amdgcn.class.f32(float %95, i32 608)
  %103 = select i1 %93, float 0x3EF0000000000000, float 1.000000e+00
  %104 = fneg float %101
  %105 = tail call float @llvm.fma.f32(float %104, float %96, float %95)
  %106 = fcmp ogt float %105, 0.000000e+00
  %107 = fneg float %99
  %108 = tail call float @llvm.fma.f32(float %107, float %96, float %95)
  %109 = fcmp ole float %108, 0.000000e+00
  %110 = select i1 %109, float %99, float %96
  %111 = select i1 %106, float %101, float %110
  %112 = fmul float %103, %111
  %113 = select i1 %102, float %95, float %112
  %114 = fpext float %113 to double
  %115 = tail call double @llvm.minnum.f64(double %114, double 2.550000e+02)
  %116 = fptoui double %115 to i8
  %117 = add nsw i32 %18, %71
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %118
  store i8 %116, i8 addrspace(1)* %119, align 1, !tbaa !7
  br label %120

120:                                              ; preds = %4, %20, %28
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
