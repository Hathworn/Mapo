; ModuleID = '../data/hip_kernels/8192/194/main.cu'
source_filename = "../data/hip_kernels/8192/194/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21ComputeDistanceKerneliPfS_iS_(i32 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = icmp slt i32 %25, %3
  br i1 %26, label %27, label %176

27:                                               ; preds = %5
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %29, label %57

29:                                               ; preds = %27
  %30 = mul nsw i32 %25, %0
  %31 = and i32 %0, 7
  %32 = icmp ult i32 %0, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %0, -8
  br label %82

35:                                               ; preds = %82, %29
  %36 = phi float [ undef, %29 ], [ %172, %82 ]
  %37 = phi i32 [ 0, %29 ], [ %173, %82 ]
  %38 = phi float [ 0.000000e+00, %29 ], [ %172, %82 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %57, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %54, %40 ], [ %37, %35 ]
  %42 = phi float [ %53, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %55, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = zext i32 %41 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !5
  %51 = fmul contract float %47, %50
  %52 = fmul contract float %47, %51
  %53 = fadd contract float %42, %52
  %54 = add nuw nsw i32 %41, 1
  %55 = add i32 %43, 1
  %56 = icmp eq i32 %55, %31
  br i1 %56, label %57, label %40, !llvm.loop !20

57:                                               ; preds = %35, %40, %27
  %58 = phi float [ 0.000000e+00, %27 ], [ %36, %35 ], [ %53, %40 ]
  %59 = fcmp olt float %58, 0x39F0000000000000
  %60 = select i1 %59, float 0x41F0000000000000, float 1.000000e+00
  %61 = fmul float %58, %60
  %62 = tail call float @llvm.sqrt.f32(float %61)
  %63 = bitcast float %62 to i32
  %64 = add nsw i32 %63, -1
  %65 = bitcast i32 %64 to float
  %66 = add nsw i32 %63, 1
  %67 = bitcast i32 %66 to float
  %68 = tail call i1 @llvm.amdgcn.class.f32(float %61, i32 608)
  %69 = select i1 %59, float 0x3EF0000000000000, float 1.000000e+00
  %70 = fneg float %67
  %71 = tail call float @llvm.fma.f32(float %70, float %62, float %61)
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = fneg float %65
  %74 = tail call float @llvm.fma.f32(float %73, float %62, float %61)
  %75 = fcmp ole float %74, 0.000000e+00
  %76 = select i1 %75, float %65, float %62
  %77 = select i1 %72, float %67, float %76
  %78 = fmul float %69, %77
  %79 = select i1 %68, float %61, float %78
  %80 = sext i32 %25 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %79, float addrspace(1)* %81, align 4, !tbaa !16
  br label %176

82:                                               ; preds = %82, %33
  %83 = phi i32 [ 0, %33 ], [ %173, %82 ]
  %84 = phi float [ 0.000000e+00, %33 ], [ %172, %82 ]
  %85 = phi i32 [ 0, %33 ], [ %174, %82 ]
  %86 = add nsw i32 %83, %30
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !5
  %90 = zext i32 %83 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = fmul contract float %89, %92
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %84, %94
  %96 = or i32 %83, 1
  %97 = add nsw i32 %96, %30
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %4, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !5
  %101 = zext i32 %96 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16, !amdgpu.noclobber !5
  %104 = fmul contract float %100, %103
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %95, %105
  %107 = or i32 %83, 2
  %108 = add nsw i32 %107, %30
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !16, !amdgpu.noclobber !5
  %112 = zext i32 %107 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !5
  %115 = fmul contract float %111, %114
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %106, %116
  %118 = or i32 %83, 3
  %119 = add nsw i32 %118, %30
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %4, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16, !amdgpu.noclobber !5
  %123 = zext i32 %118 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !5
  %126 = fmul contract float %122, %125
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %117, %127
  %129 = or i32 %83, 4
  %130 = add nsw i32 %129, %30
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16, !amdgpu.noclobber !5
  %134 = zext i32 %129 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16, !amdgpu.noclobber !5
  %137 = fmul contract float %133, %136
  %138 = fmul contract float %133, %137
  %139 = fadd contract float %128, %138
  %140 = or i32 %83, 5
  %141 = add nsw i32 %140, %30
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %4, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16, !amdgpu.noclobber !5
  %145 = zext i32 %140 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %2, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16, !amdgpu.noclobber !5
  %148 = fmul contract float %144, %147
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %139, %149
  %151 = or i32 %83, 6
  %152 = add nsw i32 %151, %30
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %4, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16, !amdgpu.noclobber !5
  %156 = zext i32 %151 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16, !amdgpu.noclobber !5
  %159 = fmul contract float %155, %158
  %160 = fmul contract float %155, %159
  %161 = fadd contract float %150, %160
  %162 = or i32 %83, 7
  %163 = add nsw i32 %162, %30
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %4, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16, !amdgpu.noclobber !5
  %167 = zext i32 %162 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %2, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16, !amdgpu.noclobber !5
  %170 = fmul contract float %166, %169
  %171 = fmul contract float %166, %170
  %172 = fadd contract float %161, %171
  %173 = add nuw nsw i32 %83, 8
  %174 = add i32 %85, 8
  %175 = icmp eq i32 %174, %34
  br i1 %175, label %35, label %82, !llvm.loop !22

176:                                              ; preds = %57, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
