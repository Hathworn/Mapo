; ModuleID = '../data/hip_kernels/8535/1/main.cu'
source_filename = "../data/hip_kernels/8535/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5sobelPhS_iiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %7, %4
  %10 = mul nsw i32 %8, %5
  %11 = add i32 %9, 3
  %12 = add i32 %11, %10
  %13 = add i32 %12, -1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %14
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !5, !amdgpu.noclobber !8
  %17 = sext i8 %16 to i32
  %18 = shl nsw i32 %17, 2
  %19 = add i32 %12, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !5, !amdgpu.noclobber !8
  %23 = sext i8 %22 to i32
  %24 = mul nsw i32 %23, -3
  %25 = add nsw i32 %24, %18
  %26 = sub nsw i32 %25, %23
  %27 = mul nsw i32 %26, %26
  %28 = sitofp i32 %27 to float
  %29 = icmp eq i32 %25, %23
  %30 = select i1 %29, float 0x41F0000000000000, float 1.000000e+00
  %31 = fmul float %30, %28
  %32 = tail call float @llvm.sqrt.f32(float %31)
  %33 = bitcast float %32 to i32
  %34 = add nsw i32 %33, -1
  %35 = bitcast i32 %34 to float
  %36 = add nsw i32 %33, 1
  %37 = bitcast i32 %36 to float
  %38 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 608)
  %39 = select i1 %29, float 0x3EF0000000000000, float 1.000000e+00
  %40 = fneg float %37
  %41 = tail call float @llvm.fma.f32(float %40, float %32, float %31)
  %42 = fcmp ogt float %41, 0.000000e+00
  %43 = fneg float %35
  %44 = tail call float @llvm.fma.f32(float %43, float %32, float %31)
  %45 = fcmp ole float %44, 0.000000e+00
  %46 = select i1 %45, float %35, float %32
  %47 = select i1 %42, float %37, float %46
  %48 = fmul float %39, %47
  %49 = select i1 %38, float %31, float %48
  %50 = fptoui float %49 to i8
  %51 = add nsw i32 %10, %9
  %52 = add i32 %51, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  store i8 %50, i8 addrspace(1)* %54, align 1, !tbaa !5
  %55 = add i32 %51, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !5
  %59 = sext i8 %58 to i32
  %60 = shl nsw i32 %59, 2
  %61 = add i32 %51, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !5
  %65 = sext i8 %64 to i32
  %66 = mul nsw i32 %65, -3
  %67 = add nsw i32 %66, %60
  %68 = sub nsw i32 %67, %65
  %69 = mul nsw i32 %68, %68
  %70 = sitofp i32 %69 to float
  %71 = icmp eq i32 %67, %65
  %72 = select i1 %71, float 0x41F0000000000000, float 1.000000e+00
  %73 = fmul float %72, %70
  %74 = tail call float @llvm.sqrt.f32(float %73)
  %75 = bitcast float %74 to i32
  %76 = add nsw i32 %75, -1
  %77 = bitcast i32 %76 to float
  %78 = add nsw i32 %75, 1
  %79 = bitcast i32 %78 to float
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %73, i32 608)
  %81 = select i1 %71, float 0x3EF0000000000000, float 1.000000e+00
  %82 = fneg float %79
  %83 = tail call float @llvm.fma.f32(float %82, float %74, float %73)
  %84 = fcmp ogt float %83, 0.000000e+00
  %85 = fneg float %77
  %86 = tail call float @llvm.fma.f32(float %85, float %74, float %73)
  %87 = fcmp ole float %86, 0.000000e+00
  %88 = select i1 %87, float %77, float %74
  %89 = select i1 %84, float %79, float %88
  %90 = fmul float %81, %89
  %91 = select i1 %80, float %73, float %90
  %92 = fptoui float %91 to i8
  %93 = add i32 %51, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %94
  store i8 %92, i8 addrspace(1)* %95, align 1, !tbaa !5
  %96 = sext i32 %51 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !5
  %99 = sext i8 %98 to i32
  %100 = shl nsw i32 %99, 2
  %101 = add i32 %51, 2
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !5
  %105 = sext i8 %104 to i32
  %106 = mul nsw i32 %105, -3
  %107 = add nsw i32 %106, %100
  %108 = sub nsw i32 %107, %105
  %109 = mul nsw i32 %108, %108
  %110 = sitofp i32 %109 to float
  %111 = icmp eq i32 %107, %105
  %112 = select i1 %111, float 0x41F0000000000000, float 1.000000e+00
  %113 = fmul float %112, %110
  %114 = tail call float @llvm.sqrt.f32(float %113)
  %115 = bitcast float %114 to i32
  %116 = add nsw i32 %115, -1
  %117 = bitcast i32 %116 to float
  %118 = add nsw i32 %115, 1
  %119 = bitcast i32 %118 to float
  %120 = tail call i1 @llvm.amdgcn.class.f32(float %113, i32 608)
  %121 = select i1 %111, float 0x3EF0000000000000, float 1.000000e+00
  %122 = fneg float %119
  %123 = tail call float @llvm.fma.f32(float %122, float %114, float %113)
  %124 = fcmp ogt float %123, 0.000000e+00
  %125 = fneg float %117
  %126 = tail call float @llvm.fma.f32(float %125, float %114, float %113)
  %127 = fcmp ole float %126, 0.000000e+00
  %128 = select i1 %127, float %117, float %114
  %129 = select i1 %124, float %119, float %128
  %130 = fmul float %121, %129
  %131 = select i1 %120, float %113, float %130
  %132 = fptoui float %131 to i8
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %96
  store i8 %132, i8 addrspace(1)* %133, align 1, !tbaa !5
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
