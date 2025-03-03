; ModuleID = '../data/hip_kernels/11654/17/main.cu'
source_filename = "../data/hip_kernels/11654/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17euclideanDistancePKfiS0_iiPf(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = icmp slt i32 %7, %1
  %10 = icmp slt i32 %8, %3
  %11 = select i1 %9, i1 %10, i1 false
  br i1 %11, label %12, label %165

12:                                               ; preds = %6
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %14, label %43

14:                                               ; preds = %12
  %15 = and i32 %4, 7
  %16 = icmp ult i32 %4, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %4, -8
  br label %70

19:                                               ; preds = %70, %14
  %20 = phi float [ undef, %14 ], [ %160, %70 ]
  %21 = phi i32 [ %7, %14 ], [ %161, %70 ]
  %22 = phi float [ 0.000000e+00, %14 ], [ %160, %70 ]
  %23 = phi i32 [ %8, %14 ], [ %162, %70 ]
  %24 = icmp eq i32 %15, 0
  br i1 %24, label %43, label %25

25:                                               ; preds = %19, %25
  %26 = phi i32 [ %39, %25 ], [ %21, %19 ]
  %27 = phi float [ %38, %25 ], [ %22, %19 ]
  %28 = phi i32 [ %40, %25 ], [ %23, %19 ]
  %29 = phi i32 [ %41, %25 ], [ 0, %19 ]
  %30 = sext i32 %26 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = sext i32 %28 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fsub contract float %32, %35
  %37 = fmul contract float %36, %36
  %38 = fadd contract float %27, %37
  %39 = add nsw i32 %26, %1
  %40 = add nsw i32 %28, %3
  %41 = add i32 %29, 1
  %42 = icmp eq i32 %41, %15
  br i1 %42, label %43, label %25, !llvm.loop !10

43:                                               ; preds = %19, %25, %12
  %44 = phi float [ 0.000000e+00, %12 ], [ %20, %19 ], [ %38, %25 ]
  %45 = fcmp olt float %44, 0x39F0000000000000
  %46 = select i1 %45, float 0x41F0000000000000, float 1.000000e+00
  %47 = fmul float %44, %46
  %48 = tail call float @llvm.sqrt.f32(float %47)
  %49 = bitcast float %48 to i32
  %50 = add nsw i32 %49, -1
  %51 = bitcast i32 %50 to float
  %52 = add nsw i32 %49, 1
  %53 = bitcast i32 %52 to float
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 608)
  %55 = select i1 %45, float 0x3EF0000000000000, float 1.000000e+00
  %56 = fneg float %53
  %57 = tail call float @llvm.fma.f32(float %56, float %48, float %47)
  %58 = fcmp ogt float %57, 0.000000e+00
  %59 = fneg float %51
  %60 = tail call float @llvm.fma.f32(float %59, float %48, float %47)
  %61 = fcmp ole float %60, 0.000000e+00
  %62 = select i1 %61, float %51, float %48
  %63 = select i1 %58, float %53, float %62
  %64 = fmul float %55, %63
  %65 = select i1 %54, float %47, float %64
  %66 = mul nsw i32 %8, %1
  %67 = add nsw i32 %66, %7
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %5, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !5
  br label %165

70:                                               ; preds = %70, %17
  %71 = phi i32 [ %7, %17 ], [ %161, %70 ]
  %72 = phi float [ 0.000000e+00, %17 ], [ %160, %70 ]
  %73 = phi i32 [ %8, %17 ], [ %162, %70 ]
  %74 = phi i32 [ 0, %17 ], [ %163, %70 ]
  %75 = sext i32 %71 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = sext i32 %73 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = fsub contract float %77, %80
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %72, %82
  %84 = add nsw i32 %71, %1
  %85 = add nsw i32 %73, %3
  %86 = sext i32 %84 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = sext i32 %85 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = fsub contract float %88, %91
  %93 = fmul contract float %92, %92
  %94 = fadd contract float %83, %93
  %95 = add nsw i32 %84, %1
  %96 = add nsw i32 %85, %3
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = sext i32 %96 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fsub contract float %99, %102
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %94, %104
  %106 = add nsw i32 %95, %1
  %107 = add nsw i32 %96, %3
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = sext i32 %107 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = fsub contract float %110, %113
  %115 = fmul contract float %114, %114
  %116 = fadd contract float %105, %115
  %117 = add nsw i32 %106, %1
  %118 = add nsw i32 %107, %3
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = sext i32 %118 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = fsub contract float %121, %124
  %126 = fmul contract float %125, %125
  %127 = fadd contract float %116, %126
  %128 = add nsw i32 %117, %1
  %129 = add nsw i32 %118, %3
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = sext i32 %129 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = fsub contract float %132, %135
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %127, %137
  %139 = add nsw i32 %128, %1
  %140 = add nsw i32 %129, %3
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = sext i32 %140 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  %147 = fsub contract float %143, %146
  %148 = fmul contract float %147, %147
  %149 = fadd contract float %138, %148
  %150 = add nsw i32 %139, %1
  %151 = add nsw i32 %140, %3
  %152 = sext i32 %150 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !5, !amdgpu.noclobber !9
  %155 = sext i32 %151 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !5, !amdgpu.noclobber !9
  %158 = fsub contract float %154, %157
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %149, %159
  %161 = add nsw i32 %150, %1
  %162 = add nsw i32 %151, %3
  %163 = add i32 %74, 8
  %164 = icmp eq i32 %163, %18
  br i1 %164, label %19, label %70, !llvm.loop !12

165:                                              ; preds = %43, %6
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
