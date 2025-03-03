; ModuleID = '../data/hip_kernels/2305/1/main.cu'
source_filename = "../data/hip_kernels/2305/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__const._Z19GaussianKernelArrayPKhPhiiii.filter = private unnamed_addr addrspace(4) constant [5 x [5 x float]] [[5 x float] [float 0x3F68527AE0000000, float 0x3F8B404940000000, float 0x3F9676F9C0000000, float 0x3F8B404940000000, float 0x3F68527AE0000000], [5 x float] [float 0x3F8B404940000000, float 0x3FAE8862E0000000, float 0x3FB92B8560000000, float 0x3FAE8862E0000000, float 0x3F8B404940000000], [5 x float] [float 0x3F9676F9C0000000, float 0x3FB92B8560000000, float 0x3FC4BFC900000000, float 0x3FB92B8560000000, float 0x3F9676F9C0000000], [5 x float] [float 0x3F8B404940000000, float 0x3FAE8862E0000000, float 0x3FB92B8560000000, float 0x3FAE8862E0000000, float 0x3F8B404940000000], [5 x float] [float 0x3F68527AE0000000, float 0x3F8B404940000000, float 0x3F9676F9C0000000, float 0x3F8B404940000000, float 0x3F68527AE0000000]], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19GaussianKernelArrayPKhPhiiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %2
  %25 = icmp slt i32 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %170

27:                                               ; preds = %6
  %28 = icmp sgt i32 %5, 0
  br i1 %28, label %29, label %45

29:                                               ; preds = %27
  %30 = and i32 %5, 7
  %31 = icmp ult i32 %5, 8
  %32 = and i32 %5, -8
  %33 = icmp eq i32 %30, 0
  br label %34

34:                                               ; preds = %29, %72
  %35 = phi i32 [ %74, %72 ], [ 0, %29 ]
  %36 = phi float [ %73, %72 ], [ 0.000000e+00, %29 ]
  %37 = zext i32 %35 to i64
  %38 = add nsw i32 %35, %23
  %39 = mul nsw i32 %38, %4
  %40 = add i32 %39, %15
  br i1 %31, label %51, label %76

41:                                               ; preds = %72
  %42 = fadd contract float %73, 5.000000e-01
  %43 = fptosi float %42 to i32
  %44 = trunc i32 %43 to i8
  br label %45

45:                                               ; preds = %41, %27
  %46 = phi i8 [ 0, %27 ], [ %44, %41 ]
  %47 = mul nsw i32 %23, %4
  %48 = add nsw i32 %47, %15
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %49
  store i8 %46, i8 addrspace(1)* %50, align 1, !tbaa !7
  br label %170

51:                                               ; preds = %76, %34
  %52 = phi float [ undef, %34 ], [ %166, %76 ]
  %53 = phi i32 [ 0, %34 ], [ %167, %76 ]
  %54 = phi float [ %36, %34 ], [ %166, %76 ]
  br i1 %33, label %72, label %55

55:                                               ; preds = %51, %55
  %56 = phi i32 [ %69, %55 ], [ %53, %51 ]
  %57 = phi float [ %68, %55 ], [ %54, %51 ]
  %58 = phi i32 [ %70, %55 ], [ 0, %51 ]
  %59 = zext i32 %56 to i64
  %60 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %59
  %61 = load float, float addrspace(4)* %60, align 4, !tbaa !10
  %62 = add i32 %40, %56
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = uitofp i8 %65 to float
  %67 = fmul contract float %61, %66
  %68 = fadd contract float %57, %67
  %69 = add nuw nsw i32 %56, 1
  %70 = add i32 %58, 1
  %71 = icmp eq i32 %70, %30
  br i1 %71, label %72, label %55, !llvm.loop !12

72:                                               ; preds = %55, %51
  %73 = phi float [ %52, %51 ], [ %68, %55 ]
  %74 = add nuw nsw i32 %35, 1
  %75 = icmp eq i32 %74, %5
  br i1 %75, label %41, label %34, !llvm.loop !14

76:                                               ; preds = %34, %76
  %77 = phi i32 [ %167, %76 ], [ 0, %34 ]
  %78 = phi float [ %166, %76 ], [ %36, %34 ]
  %79 = phi i32 [ %168, %76 ], [ 0, %34 ]
  %80 = zext i32 %77 to i64
  %81 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %80
  %82 = load float, float addrspace(4)* %81, align 4, !tbaa !10
  %83 = add i32 %40, %77
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !amdgpu.noclobber !5
  %87 = uitofp i8 %86 to float
  %88 = fmul contract float %82, %87
  %89 = fadd contract float %78, %88
  %90 = or i32 %77, 1
  %91 = zext i32 %90 to i64
  %92 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %91
  %93 = load float, float addrspace(4)* %92, align 4, !tbaa !10
  %94 = add i32 %40, %90
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !5
  %98 = uitofp i8 %97 to float
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %89, %99
  %101 = or i32 %77, 2
  %102 = zext i32 %101 to i64
  %103 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %102
  %104 = load float, float addrspace(4)* %103, align 4, !tbaa !10
  %105 = add i32 %40, %101
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %106
  %108 = load i8, i8 addrspace(1)* %107, align 1, !tbaa !7, !amdgpu.noclobber !5
  %109 = uitofp i8 %108 to float
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %100, %110
  %112 = or i32 %77, 3
  %113 = zext i32 %112 to i64
  %114 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %113
  %115 = load float, float addrspace(4)* %114, align 4, !tbaa !10
  %116 = add i32 %40, %112
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7, !amdgpu.noclobber !5
  %120 = uitofp i8 %119 to float
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %111, %121
  %123 = or i32 %77, 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %124
  %126 = load float, float addrspace(4)* %125, align 4, !tbaa !10
  %127 = add i32 %40, %123
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %128
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !7, !amdgpu.noclobber !5
  %131 = uitofp i8 %130 to float
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %122, %132
  %134 = or i32 %77, 5
  %135 = zext i32 %134 to i64
  %136 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %135
  %137 = load float, float addrspace(4)* %136, align 4, !tbaa !10
  %138 = add i32 %40, %134
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !7, !amdgpu.noclobber !5
  %142 = uitofp i8 %141 to float
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %133, %143
  %145 = or i32 %77, 6
  %146 = zext i32 %145 to i64
  %147 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %146
  %148 = load float, float addrspace(4)* %147, align 4, !tbaa !10
  %149 = add i32 %40, %145
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %150
  %152 = load i8, i8 addrspace(1)* %151, align 1, !tbaa !7, !amdgpu.noclobber !5
  %153 = uitofp i8 %152 to float
  %154 = fmul contract float %148, %153
  %155 = fadd contract float %144, %154
  %156 = or i32 %77, 7
  %157 = zext i32 %156 to i64
  %158 = getelementptr [5 x [5 x float]], [5 x [5 x float]] addrspace(4)* @__const._Z19GaussianKernelArrayPKhPhiiii.filter, i64 0, i64 %37, i64 %157
  %159 = load float, float addrspace(4)* %158, align 4, !tbaa !10
  %160 = add i32 %40, %156
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %161
  %163 = load i8, i8 addrspace(1)* %162, align 1, !tbaa !7, !amdgpu.noclobber !5
  %164 = uitofp i8 %163 to float
  %165 = fmul contract float %159, %164
  %166 = fadd contract float %155, %165
  %167 = add nuw nsw i32 %77, 8
  %168 = add i32 %79, 8
  %169 = icmp eq i32 %168, %32
  br i1 %169, label %51, label %76, !llvm.loop !16

170:                                              ; preds = %45, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
