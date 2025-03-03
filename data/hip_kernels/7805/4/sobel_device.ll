; ModuleID = '../data/hip_kernels/7805/4/main.cu'
source_filename = "../data/hip_kernels/7805/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5sobelPhS_iiE6pixels = internal unnamed_addr addrspace(3) global [18 x [18 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
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
  br i1 %24, label %25, label %148

25:                                               ; preds = %4
  %26 = add i32 %11, -1
  %27 = add i32 %19, -1
  %28 = tail call i32 @llvm.smax.i32(i32 %26, i32 0)
  %29 = tail call i32 @llvm.smax.i32(i32 %27, i32 0)
  %30 = mul nuw nsw i32 %20, %10
  %31 = add nuw nsw i32 %30, %12
  %32 = icmp ult i32 %31, 162
  br i1 %32, label %33, label %61

33:                                               ; preds = %25
  %34 = icmp slt i32 %29, %3
  %35 = add nsw i32 %18, -1
  %36 = select i1 %34, i32 %29, i32 %35
  %37 = icmp slt i32 %28, %2
  %38 = add nsw i32 %10, -1
  %39 = select i1 %37, i32 %28, i32 %38
  %40 = mul nsw i32 %36, %2
  %41 = add nsw i32 %40, %39
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %42
  %44 = trunc i32 %31 to i16
  %45 = udiv i16 %44, 9
  %46 = zext i16 %45 to i32
  %47 = trunc i32 %31 to i8
  %48 = urem i8 %47, 9
  %49 = shl nuw nsw i8 %48, 1
  %50 = zext i8 %49 to i32
  %51 = mul nsw i32 %46, %2
  %52 = add nsw i32 %51, %50
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %46, i32 %50
  store i8 %55, i8 addrspace(3)* %56, align 2, !tbaa !7
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %54, i64 1
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7, !amdgpu.noclobber !5
  %59 = or i32 %50, 1
  %60 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %46, i32 %59
  store i8 %58, i8 addrspace(3)* %60, align 1, !tbaa !7
  br label %61

61:                                               ; preds = %33, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = add nuw nsw i32 %12, 1
  %63 = add nuw nsw i32 %20, 1
  %64 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %20, i32 %12
  %65 = load i8, i8 addrspace(3)* %64, align 1, !tbaa !7
  %66 = uitofp i8 %65 to float
  %67 = fsub contract float 0.000000e+00, %66
  %68 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %20, i32 %62
  %69 = load i8, i8 addrspace(3)* %68, align 1, !tbaa !7
  %70 = uitofp i8 %69 to float
  %71 = fmul contract float %70, -2.000000e+00
  %72 = fadd contract float %67, %71
  %73 = fmul contract float %70, 0.000000e+00
  %74 = fadd contract float %67, %73
  %75 = add nuw nsw i32 %12, 2
  %76 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %20, i32 %75
  %77 = load i8, i8 addrspace(3)* %76, align 1, !tbaa !7
  %78 = uitofp i8 %77 to float
  %79 = fsub contract float %72, %78
  %80 = fadd contract float %74, %78
  %81 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %63, i32 %12
  %82 = load i8, i8 addrspace(3)* %81, align 1, !tbaa !7
  %83 = uitofp i8 %82 to float
  %84 = fmul contract float %83, 0.000000e+00
  %85 = fadd contract float %79, %84
  %86 = fmul contract float %83, -2.000000e+00
  %87 = fadd contract float %80, %86
  %88 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %63, i32 %62
  %89 = load i8, i8 addrspace(3)* %88, align 1, !tbaa !7
  %90 = uitofp i8 %89 to float
  %91 = fmul contract float %90, 0.000000e+00
  %92 = fadd contract float %85, %91
  %93 = fadd contract float %87, %91
  %94 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %63, i32 %75
  %95 = load i8, i8 addrspace(3)* %94, align 1, !tbaa !7
  %96 = uitofp i8 %95 to float
  %97 = fmul contract float %96, 0.000000e+00
  %98 = fadd contract float %92, %97
  %99 = fmul contract float %96, 2.000000e+00
  %100 = fadd contract float %93, %99
  %101 = add nuw nsw i32 %20, 2
  %102 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %101, i32 %12
  %103 = load i8, i8 addrspace(3)* %102, align 1, !tbaa !7
  %104 = uitofp i8 %103 to float
  %105 = fadd contract float %98, %104
  %106 = fsub contract float %100, %104
  %107 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %101, i32 %62
  %108 = load i8, i8 addrspace(3)* %107, align 1, !tbaa !7
  %109 = uitofp i8 %108 to float
  %110 = fmul contract float %109, 2.000000e+00
  %111 = fadd contract float %105, %110
  %112 = fmul contract float %109, 0.000000e+00
  %113 = fadd contract float %106, %112
  %114 = getelementptr inbounds [18 x [18 x i8]], [18 x [18 x i8]] addrspace(3)* @_ZZ5sobelPhS_iiE6pixels, i32 0, i32 %101, i32 %75
  %115 = load i8, i8 addrspace(3)* %114, align 1, !tbaa !7
  %116 = uitofp i8 %115 to float
  %117 = fadd contract float %111, %116
  %118 = fadd contract float %113, %116
  %119 = mul nsw i32 %21, %2
  %120 = add nsw i32 %119, %13
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %121
  %123 = fmul contract float %117, %117
  %124 = fmul contract float %118, %118
  %125 = fadd contract float %124, %123
  %126 = fcmp olt float %125, 0x39F0000000000000
  %127 = select i1 %126, float 0x41F0000000000000, float 1.000000e+00
  %128 = fmul float %125, %127
  %129 = tail call float @llvm.sqrt.f32(float %128)
  %130 = bitcast float %129 to i32
  %131 = add nsw i32 %130, -1
  %132 = bitcast i32 %131 to float
  %133 = add nsw i32 %130, 1
  %134 = bitcast i32 %133 to float
  %135 = tail call i1 @llvm.amdgcn.class.f32(float %128, i32 608)
  %136 = select i1 %126, float 0x3EF0000000000000, float 1.000000e+00
  %137 = fneg float %134
  %138 = tail call float @llvm.fma.f32(float %137, float %129, float %128)
  %139 = fcmp ogt float %138, 0.000000e+00
  %140 = fneg float %132
  %141 = tail call float @llvm.fma.f32(float %140, float %129, float %128)
  %142 = fcmp ole float %141, 0.000000e+00
  %143 = select i1 %142, float %132, float %129
  %144 = select i1 %139, float %134, float %143
  %145 = fmul float %136, %144
  %146 = select i1 %135, float %128, float %145
  %147 = fptoui float %146 to i8
  store i8 %147, i8 addrspace(1)* %122, align 1, !tbaa !7
  br label %148

148:                                              ; preds = %4, %61
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
