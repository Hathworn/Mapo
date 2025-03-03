; ModuleID = '../data/hip_kernels/14142/7/main.cu'
source_filename = "../data/hip_kernels/14142/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z42cunn_SpatialLogSoftMax_updateOutput_kernelPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = mul nsw i32 %4, %3
  %9 = mul i32 %8, %6
  %10 = icmp sgt i32 %2, 0
  %11 = mul i32 %6, %2
  %12 = mul i32 %11, %3
  %13 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = and i32 %2, 7
  %17 = icmp ult i32 %2, 8
  %18 = and i32 %2, -8
  %19 = icmp eq i32 %16, 0
  %20 = and i32 %2, 1
  %21 = icmp eq i32 %2, 1
  %22 = and i32 %2, -2
  %23 = icmp eq i32 %20, 0
  br label %24

24:                                               ; preds = %209, %5
  %25 = phi i32 [ %7, %5 ], [ %210, %209 ]
  %26 = icmp slt i32 %25, %8
  br i1 %26, label %27, label %211

27:                                               ; preds = %24
  %28 = freeze i32 %25
  %29 = freeze i32 %4
  %30 = sdiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  %33 = icmp slt i32 %30, %3
  br i1 %33, label %34, label %209

34:                                               ; preds = %27
  %35 = mul i32 %30, %4
  %36 = add i32 %35, %9
  %37 = add i32 %36, %32
  %38 = mul i32 %37, %2
  br i1 %10, label %39, label %57

39:                                               ; preds = %34
  br i1 %17, label %40, label %64

40:                                               ; preds = %64, %39
  %41 = phi float [ undef, %39 ], [ %122, %64 ]
  %42 = phi i32 [ 0, %39 ], [ %123, %64 ]
  %43 = phi float [ 0.000000e+00, %39 ], [ %122, %64 ]
  br i1 %19, label %57, label %44

44:                                               ; preds = %40, %44
  %45 = phi i32 [ %54, %44 ], [ %42, %40 ]
  %46 = phi float [ %53, %44 ], [ %43, %40 ]
  %47 = phi i32 [ %55, %44 ], [ 0, %40 ]
  %48 = add nsw i32 %45, %38
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = tail call float @llvm.exp.f32(float %51)
  %53 = fadd contract float %46, %52
  %54 = add nuw nsw i32 %45, 1
  %55 = add i32 %47, 1
  %56 = icmp eq i32 %55, %16
  br i1 %56, label %57, label %44, !llvm.loop !9

57:                                               ; preds = %40, %44, %34
  %58 = phi float [ 0.000000e+00, %34 ], [ %41, %40 ], [ %53, %44 ]
  %59 = fdiv contract float 1.000000e+00, %58
  br i1 %10, label %60, label %152

60:                                               ; preds = %57
  %61 = add i32 %30, %12
  %62 = mul i32 %61, %4
  %63 = add i32 %62, %32
  br i1 %21, label %126, label %156

64:                                               ; preds = %39, %64
  %65 = phi i32 [ %123, %64 ], [ 0, %39 ]
  %66 = phi float [ %122, %64 ], [ 0.000000e+00, %39 ]
  %67 = phi i32 [ %124, %64 ], [ 0, %39 ]
  %68 = add nsw i32 %65, %38
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = tail call float @llvm.exp.f32(float %71)
  %73 = fadd contract float %66, %72
  %74 = or i32 %65, 1
  %75 = add nsw i32 %74, %38
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = tail call float @llvm.exp.f32(float %78)
  %80 = fadd contract float %73, %79
  %81 = or i32 %65, 2
  %82 = add nsw i32 %81, %38
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = tail call float @llvm.exp.f32(float %85)
  %87 = fadd contract float %80, %86
  %88 = or i32 %65, 3
  %89 = add nsw i32 %88, %38
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = tail call float @llvm.exp.f32(float %92)
  %94 = fadd contract float %87, %93
  %95 = or i32 %65, 4
  %96 = add nsw i32 %95, %38
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5
  %100 = tail call float @llvm.exp.f32(float %99)
  %101 = fadd contract float %94, %100
  %102 = or i32 %65, 5
  %103 = add nsw i32 %102, %38
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = tail call float @llvm.exp.f32(float %106)
  %108 = fadd contract float %101, %107
  %109 = or i32 %65, 6
  %110 = add nsw i32 %109, %38
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5
  %114 = tail call float @llvm.exp.f32(float %113)
  %115 = fadd contract float %108, %114
  %116 = or i32 %65, 7
  %117 = add nsw i32 %116, %38
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = tail call float @llvm.exp.f32(float %120)
  %122 = fadd contract float %115, %121
  %123 = add nuw nsw i32 %65, 8
  %124 = add i32 %67, 8
  %125 = icmp eq i32 %124, %18
  br i1 %125, label %40, label %64, !llvm.loop !11

126:                                              ; preds = %156, %60
  %127 = phi i32 [ 0, %60 ], [ %206, %156 ]
  br i1 %23, label %152, label %128

128:                                              ; preds = %126
  %129 = mul nsw i32 %127, %8
  %130 = add i32 %63, %129
  %131 = add nsw i32 %127, %38
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5
  %135 = tail call float @llvm.exp.f32(float %134)
  %136 = fmul contract float %59, %135
  %137 = tail call i1 @llvm.amdgcn.class.f32(float %136, i32 144)
  %138 = select i1 %137, float 0x41F0000000000000, float 1.000000e+00
  %139 = fmul float %136, %138
  %140 = tail call float @llvm.log2.f32(float %139)
  %141 = fmul float %140, 0x3FE62E42E0000000
  %142 = tail call i1 @llvm.amdgcn.class.f32(float %140, i32 519)
  %143 = fneg float %141
  %144 = tail call float @llvm.fma.f32(float %140, float 0x3FE62E42E0000000, float %143)
  %145 = tail call float @llvm.fma.f32(float %140, float 0x3E6EFA39E0000000, float %144)
  %146 = fadd float %141, %145
  %147 = select i1 %142, float %140, float %146
  %148 = select i1 %137, float 0x40362E4300000000, float 0.000000e+00
  %149 = fsub float %147, %148
  %150 = sext i32 %130 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %149, float addrspace(1)* %151, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %128, %126, %57
  %153 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %154 = zext i16 %153 to i32
  %155 = add i32 %25, %154
  br label %209

156:                                              ; preds = %60, %156
  %157 = phi i32 [ %206, %156 ], [ 0, %60 ]
  %158 = phi i32 [ %207, %156 ], [ 0, %60 ]
  %159 = mul nsw i32 %157, %8
  %160 = add i32 %63, %159
  %161 = add nsw i32 %157, %38
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %1, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !5
  %165 = tail call float @llvm.exp.f32(float %164)
  %166 = fmul contract float %59, %165
  %167 = tail call i1 @llvm.amdgcn.class.f32(float %166, i32 144)
  %168 = select i1 %167, float 0x41F0000000000000, float 1.000000e+00
  %169 = fmul float %166, %168
  %170 = tail call float @llvm.log2.f32(float %169)
  %171 = fmul float %170, 0x3FE62E42E0000000
  %172 = tail call i1 @llvm.amdgcn.class.f32(float %170, i32 519)
  %173 = fneg float %171
  %174 = tail call float @llvm.fma.f32(float %170, float 0x3FE62E42E0000000, float %173)
  %175 = tail call float @llvm.fma.f32(float %170, float 0x3E6EFA39E0000000, float %174)
  %176 = fadd float %171, %175
  %177 = select i1 %172, float %170, float %176
  %178 = select i1 %167, float 0x40362E4300000000, float 0.000000e+00
  %179 = fsub float %177, %178
  %180 = sext i32 %160 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  store float %179, float addrspace(1)* %181, align 4, !tbaa !5
  %182 = or i32 %157, 1
  %183 = mul nsw i32 %182, %8
  %184 = add i32 %63, %183
  %185 = add nsw i32 %182, %38
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !5
  %189 = tail call float @llvm.exp.f32(float %188)
  %190 = fmul contract float %59, %189
  %191 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 144)
  %192 = select i1 %191, float 0x41F0000000000000, float 1.000000e+00
  %193 = fmul float %190, %192
  %194 = tail call float @llvm.log2.f32(float %193)
  %195 = fmul float %194, 0x3FE62E42E0000000
  %196 = tail call i1 @llvm.amdgcn.class.f32(float %194, i32 519)
  %197 = fneg float %195
  %198 = tail call float @llvm.fma.f32(float %194, float 0x3FE62E42E0000000, float %197)
  %199 = tail call float @llvm.fma.f32(float %194, float 0x3E6EFA39E0000000, float %198)
  %200 = fadd float %195, %199
  %201 = select i1 %196, float %194, float %200
  %202 = select i1 %191, float 0x40362E4300000000, float 0.000000e+00
  %203 = fsub float %201, %202
  %204 = sext i32 %184 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  store float %203, float addrspace(1)* %205, align 4, !tbaa !5
  %206 = add nuw nsw i32 %157, 2
  %207 = add i32 %158, 2
  %208 = icmp eq i32 %207, %22
  br i1 %208, label %126, label %156, !llvm.loop !15

209:                                              ; preds = %27, %152
  %210 = phi i32 [ %155, %152 ], [ %25, %27 ]
  br i1 %33, label %24, label %211

211:                                              ; preds = %209, %24
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = distinct !{!15, !12}
