; ModuleID = '../data/hip_kernels/5182/152/main.cu'
source_filename = "../data/hip_kernels/5182/152/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32FullyConnectedAdjustMemoryKernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture writeonly %12, float addrspace(1)* nocapture writeonly %13, float addrspace(1)* nocapture readonly %14, i32 %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !6
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = udiv i32 %25, %22
  %29 = mul i32 %28, %22
  %30 = icmp ugt i32 %25, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %27
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %26
  %36 = mul i32 %35, %22
  %37 = add i32 %36, %34
  %38 = icmp slt i32 %37, %16
  br i1 %38, label %39, label %193

39:                                               ; preds = %17
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %14, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !5
  %43 = fcmp contract une float %42, 0.000000e+00
  br i1 %43, label %193, label %44

44:                                               ; preds = %39
  %45 = icmp sgt i32 %15, 0
  br i1 %45, label %46, label %123

46:                                               ; preds = %44, %119
  %47 = phi i32 [ %120, %119 ], [ %37, %44 ]
  %48 = phi i32 [ %121, %119 ], [ 0, %44 ]
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %49
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fsub contract float %51, %53
  %55 = tail call float @llvm.fabs.f32(float %54)
  %56 = getelementptr inbounds float, float addrspace(1)* %6, i64 %49
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fcmp olt float %57, 0x39F0000000000000
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %57, %59
  %61 = tail call float @llvm.sqrt.f32(float %60)
  %62 = bitcast float %61 to i32
  %63 = add nsw i32 %62, -1
  %64 = bitcast i32 %63 to float
  %65 = add nsw i32 %62, 1
  %66 = bitcast i32 %65 to float
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 608)
  %68 = select i1 %58, float 0x3EF0000000000000, float 1.000000e+00
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %69, float %61, float %60)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %64
  %73 = tail call float @llvm.fma.f32(float %72, float %61, float %60)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %64, float %61
  %76 = select i1 %71, float %66, float %75
  %77 = fmul float %68, %76
  %78 = select i1 %67, float %60, float %77
  %79 = fmul contract float %78, 2.000000e+00
  %80 = fmul contract float %53, %53
  %81 = fsub contract float %79, %80
  %82 = fcmp contract ogt float %55, %81
  br i1 %82, label %117, label %83

83:                                               ; preds = %46
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = getelementptr inbounds float, float addrspace(1)* %8, i64 %49
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fsub contract float %85, %87
  %89 = tail call float @llvm.fabs.f32(float %88)
  %90 = getelementptr inbounds float, float addrspace(1)* %10, i64 %49
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fmul contract float %91, %91
  %93 = fsub contract float %91, %92
  %94 = fcmp olt float %93, 0x39F0000000000000
  %95 = select i1 %94, float 0x41F0000000000000, float 1.000000e+00
  %96 = fmul float %93, %95
  %97 = tail call float @llvm.sqrt.f32(float %96)
  %98 = bitcast float %97 to i32
  %99 = add nsw i32 %98, -1
  %100 = bitcast i32 %99 to float
  %101 = add nsw i32 %98, 1
  %102 = bitcast i32 %101 to float
  %103 = tail call i1 @llvm.amdgcn.class.f32(float %96, i32 608)
  %104 = select i1 %94, float 0x3EF0000000000000, float 1.000000e+00
  %105 = fneg float %102
  %106 = tail call float @llvm.fma.f32(float %105, float %97, float %96)
  %107 = fcmp ogt float %106, 0.000000e+00
  %108 = fneg float %100
  %109 = tail call float @llvm.fma.f32(float %108, float %97, float %96)
  %110 = fcmp ole float %109, 0.000000e+00
  %111 = select i1 %110, float %100, float %97
  %112 = select i1 %107, float %102, float %111
  %113 = fmul float %104, %112
  %114 = select i1 %103, float %96, float %113
  %115 = fmul contract float %114, 2.000000e+00
  %116 = fcmp contract ogt float %89, %115
  br i1 %116, label %117, label %119

117:                                              ; preds = %83, %46
  %118 = getelementptr inbounds float, float addrspace(1)* %12, i64 %49
  store float 0x40019999A0000000, float addrspace(1)* %118, align 4, !tbaa !16
  br label %119

119:                                              ; preds = %117, %83
  %120 = add nsw i32 %47, %16
  %121 = add nuw nsw i32 %48, 1
  %122 = icmp eq i32 %121, %15
  br i1 %122, label %123, label %46, !llvm.loop !20

123:                                              ; preds = %119, %44
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = getelementptr inbounds float, float addrspace(1)* %5, i64 %40
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fsub contract float %125, %127
  %129 = tail call float @llvm.fabs.f32(float %128)
  %130 = getelementptr inbounds float, float addrspace(1)* %7, i64 %40
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = fcmp olt float %131, 0x39F0000000000000
  %133 = select i1 %132, float 0x41F0000000000000, float 1.000000e+00
  %134 = fmul float %131, %133
  %135 = tail call float @llvm.sqrt.f32(float %134)
  %136 = bitcast float %135 to i32
  %137 = add nsw i32 %136, -1
  %138 = bitcast i32 %137 to float
  %139 = add nsw i32 %136, 1
  %140 = bitcast i32 %139 to float
  %141 = tail call i1 @llvm.amdgcn.class.f32(float %134, i32 608)
  %142 = select i1 %132, float 0x3EF0000000000000, float 1.000000e+00
  %143 = fneg float %140
  %144 = tail call float @llvm.fma.f32(float %143, float %135, float %134)
  %145 = fcmp ogt float %144, 0.000000e+00
  %146 = fneg float %138
  %147 = tail call float @llvm.fma.f32(float %146, float %135, float %134)
  %148 = fcmp ole float %147, 0.000000e+00
  %149 = select i1 %148, float %138, float %135
  %150 = select i1 %145, float %140, float %149
  %151 = fmul float %142, %150
  %152 = select i1 %141, float %134, float %151
  %153 = fmul contract float %152, 2.000000e+00
  %154 = fmul contract float %127, %127
  %155 = fsub contract float %153, %154
  %156 = fcmp contract ogt float %129, %155
  br i1 %156, label %191, label %157

157:                                              ; preds = %123
  %158 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  %160 = getelementptr inbounds float, float addrspace(1)* %9, i64 %40
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16
  %162 = fsub contract float %159, %161
  %163 = tail call float @llvm.fabs.f32(float %162)
  %164 = getelementptr inbounds float, float addrspace(1)* %11, i64 %40
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16
  %166 = fmul contract float %165, %165
  %167 = fsub contract float %165, %166
  %168 = fcmp olt float %167, 0x39F0000000000000
  %169 = select i1 %168, float 0x41F0000000000000, float 1.000000e+00
  %170 = fmul float %167, %169
  %171 = tail call float @llvm.sqrt.f32(float %170)
  %172 = bitcast float %171 to i32
  %173 = add nsw i32 %172, -1
  %174 = bitcast i32 %173 to float
  %175 = add nsw i32 %172, 1
  %176 = bitcast i32 %175 to float
  %177 = tail call i1 @llvm.amdgcn.class.f32(float %170, i32 608)
  %178 = select i1 %168, float 0x3EF0000000000000, float 1.000000e+00
  %179 = fneg float %176
  %180 = tail call float @llvm.fma.f32(float %179, float %171, float %170)
  %181 = fcmp ogt float %180, 0.000000e+00
  %182 = fneg float %174
  %183 = tail call float @llvm.fma.f32(float %182, float %171, float %170)
  %184 = fcmp ole float %183, 0.000000e+00
  %185 = select i1 %184, float %174, float %171
  %186 = select i1 %181, float %176, float %185
  %187 = fmul float %178, %186
  %188 = select i1 %177, float %170, float %187
  %189 = fmul contract float %188, 2.000000e+00
  %190 = fcmp contract ogt float %163, %189
  br i1 %190, label %191, label %193

191:                                              ; preds = %157, %123
  %192 = getelementptr inbounds float, float addrspace(1)* %13, i64 %40
  store float 0x40019999A0000000, float addrspace(1)* %192, align 4, !tbaa !16
  br label %193

193:                                              ; preds = %157, %191, %39, %17
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!21 = !{!"llvm.loop.mustprogress"}
