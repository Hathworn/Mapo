; ModuleID = '../data/hip_kernels/3072/5/main.cu'
source_filename = "../data/hip_kernels/3072/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiifiPKfS0_PiS1_(i32 %0, i32 %1, i32 %2, float %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 3
  %12 = mul i32 %11, %1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %15 = mul i32 %10, %2
  %16 = mul i32 %15, 3
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %6, i64 %17
  %19 = mul i32 %15, %4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %20
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = icmp slt i32 %24, %2
  br i1 %30, label %31, label %63

31:                                               ; preds = %9
  %32 = icmp slt i32 %1, 1
  %33 = icmp eq i32 %4, 0
  %34 = select i1 %32, i1 true, i1 %33
  %35 = icmp slt i32 %4, 1
  %36 = add i32 %4, -1
  %37 = and i32 %4, 7
  %38 = icmp ult i32 %36, 7
  %39 = and i32 %4, -8
  %40 = icmp eq i32 %37, 0
  %41 = and i32 %4, 7
  %42 = icmp ult i32 %36, 7
  %43 = and i32 %4, -8
  %44 = icmp eq i32 %41, 0
  br label %45

45:                                               ; preds = %31, %234
  %46 = phi float [ 0x7FF0000000000000, %31 ], [ %181, %234 ]
  %47 = phi i32 [ -1, %31 ], [ %180, %234 ]
  %48 = phi i32 [ %24, %31 ], [ %237, %234 ]
  br i1 %34, label %178, label %49

49:                                               ; preds = %45
  %50 = mul nsw i32 %48, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %18, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = add nuw nsw i32 %50, 1
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %18, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = add nuw nsw i32 %50, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %18, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = mul nsw i32 %48, %4
  br label %64

63:                                               ; preds = %234, %9
  ret void

64:                                               ; preds = %49, %169
  %65 = phi float [ %46, %49 ], [ %173, %169 ]
  %66 = phi i32 [ %47, %49 ], [ %172, %169 ]
  %67 = phi i32 [ 0, %49 ], [ %174, %169 ]
  %68 = phi i32 [ 0, %49 ], [ %170, %169 ]
  %69 = mul nuw nsw i32 %67, 3
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %14, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = add nuw nsw i32 %69, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %14, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = add nuw nsw i32 %69, 2
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %14, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !6
  %81 = fsub contract float %53, %72
  %82 = fmul contract float %81, %81
  %83 = fsub contract float %57, %76
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %82, %84
  %86 = fsub contract float %61, %80
  %87 = fmul contract float %86, %86
  %88 = fadd contract float %85, %87
  %89 = fcmp olt float %88, 0x39F0000000000000
  %90 = select i1 %89, float 0x41F0000000000000, float 1.000000e+00
  %91 = fmul float %88, %90
  %92 = tail call float @llvm.sqrt.f32(float %91)
  %93 = bitcast float %92 to i32
  %94 = add nsw i32 %93, -1
  %95 = bitcast i32 %94 to float
  %96 = add nsw i32 %93, 1
  %97 = bitcast i32 %96 to float
  %98 = tail call i1 @llvm.amdgcn.class.f32(float %91, i32 608)
  %99 = select i1 %89, float 0x3EF0000000000000, float 1.000000e+00
  %100 = fneg float %97
  %101 = tail call float @llvm.fma.f32(float %100, float %92, float %91)
  %102 = fcmp ogt float %101, 0.000000e+00
  %103 = fneg float %95
  %104 = tail call float @llvm.fma.f32(float %103, float %92, float %91)
  %105 = fcmp ole float %104, 0.000000e+00
  %106 = select i1 %105, float %95, float %92
  %107 = select i1 %102, float %97, float %106
  %108 = fmul float %99, %107
  %109 = select i1 %98, float %91, float %108
  %110 = tail call float @llvm.maxnum.f32(float %109, float 0x3BC79CA100000000)
  %111 = fcmp contract olt float %110, %3
  br i1 %111, label %112, label %169

112:                                              ; preds = %64
  %113 = icmp ne i32 %68, 0
  %114 = select i1 %113, i1 true, i1 %35
  br i1 %114, label %164, label %115

115:                                              ; preds = %112
  br i1 %38, label %153, label %116

116:                                              ; preds = %115, %116
  %117 = phi i32 [ %150, %116 ], [ 0, %115 ]
  %118 = phi i32 [ %151, %116 ], [ 0, %115 ]
  %119 = add nsw i32 %117, %62
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %120
  store i32 %67, i32 addrspace(1)* %121, align 4, !tbaa !11
  %122 = or i32 %117, 1
  %123 = add nsw i32 %122, %62
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %124
  store i32 %67, i32 addrspace(1)* %125, align 4, !tbaa !11
  %126 = or i32 %117, 2
  %127 = add nsw i32 %126, %62
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %128
  store i32 %67, i32 addrspace(1)* %129, align 4, !tbaa !11
  %130 = or i32 %117, 3
  %131 = add nsw i32 %130, %62
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %132
  store i32 %67, i32 addrspace(1)* %133, align 4, !tbaa !11
  %134 = or i32 %117, 4
  %135 = add nsw i32 %134, %62
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %136
  store i32 %67, i32 addrspace(1)* %137, align 4, !tbaa !11
  %138 = or i32 %117, 5
  %139 = add nsw i32 %138, %62
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %140
  store i32 %67, i32 addrspace(1)* %141, align 4, !tbaa !11
  %142 = or i32 %117, 6
  %143 = add nsw i32 %142, %62
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %144
  store i32 %67, i32 addrspace(1)* %145, align 4, !tbaa !11
  %146 = or i32 %117, 7
  %147 = add nsw i32 %146, %62
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %148
  store i32 %67, i32 addrspace(1)* %149, align 4, !tbaa !11
  %150 = add nuw nsw i32 %117, 8
  %151 = add i32 %118, 8
  %152 = icmp eq i32 %151, %39
  br i1 %152, label %153, label %116, !llvm.loop !13

153:                                              ; preds = %116, %115
  %154 = phi i32 [ 0, %115 ], [ %150, %116 ]
  br i1 %40, label %164, label %155

155:                                              ; preds = %153, %155
  %156 = phi i32 [ %161, %155 ], [ %154, %153 ]
  %157 = phi i32 [ %162, %155 ], [ 0, %153 ]
  %158 = add nsw i32 %156, %62
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %159
  store i32 %67, i32 addrspace(1)* %160, align 4, !tbaa !11
  %161 = add nuw nsw i32 %156, 1
  %162 = add i32 %157, 1
  %163 = icmp eq i32 %162, %37
  br i1 %163, label %164, label %155, !llvm.loop !15

164:                                              ; preds = %153, %155, %112
  %165 = add nsw i32 %68, %62
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %166
  store i32 %67, i32 addrspace(1)* %167, align 4, !tbaa !11
  %168 = add nsw i32 %68, 1
  br label %169

169:                                              ; preds = %164, %64
  %170 = phi i32 [ %168, %164 ], [ %68, %64 ]
  %171 = fcmp contract olt float %110, %65
  %172 = select i1 %171, i32 %67, i32 %66
  %173 = select i1 %171, float %110, float %65
  %174 = add nuw nsw i32 %67, 1
  %175 = icmp sge i32 %174, %1
  %176 = icmp eq i32 %170, %4
  %177 = select i1 %175, i1 true, i1 %176
  br i1 %177, label %178, label %64, !llvm.loop !17

178:                                              ; preds = %169, %45
  %179 = phi i32 [ 0, %45 ], [ %170, %169 ]
  %180 = phi i32 [ %47, %45 ], [ %172, %169 ]
  %181 = phi float [ %46, %45 ], [ %173, %169 ]
  %182 = icmp ne i32 %179, 0
  %183 = select i1 %182, i1 true, i1 %35
  br i1 %183, label %234, label %184

184:                                              ; preds = %178
  %185 = mul nsw i32 %48, %4
  br i1 %42, label %223, label %186

186:                                              ; preds = %184, %186
  %187 = phi i32 [ %220, %186 ], [ 0, %184 ]
  %188 = phi i32 [ %221, %186 ], [ 0, %184 ]
  %189 = add nsw i32 %187, %185
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %190
  store i32 %180, i32 addrspace(1)* %191, align 4, !tbaa !11
  %192 = or i32 %187, 1
  %193 = add nsw i32 %192, %185
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %194
  store i32 %180, i32 addrspace(1)* %195, align 4, !tbaa !11
  %196 = or i32 %187, 2
  %197 = add nsw i32 %196, %185
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %198
  store i32 %180, i32 addrspace(1)* %199, align 4, !tbaa !11
  %200 = or i32 %187, 3
  %201 = add nsw i32 %200, %185
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %202
  store i32 %180, i32 addrspace(1)* %203, align 4, !tbaa !11
  %204 = or i32 %187, 4
  %205 = add nsw i32 %204, %185
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %206
  store i32 %180, i32 addrspace(1)* %207, align 4, !tbaa !11
  %208 = or i32 %187, 5
  %209 = add nsw i32 %208, %185
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %210
  store i32 %180, i32 addrspace(1)* %211, align 4, !tbaa !11
  %212 = or i32 %187, 6
  %213 = add nsw i32 %212, %185
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %214
  store i32 %180, i32 addrspace(1)* %215, align 4, !tbaa !11
  %216 = or i32 %187, 7
  %217 = add nsw i32 %216, %185
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %218
  store i32 %180, i32 addrspace(1)* %219, align 4, !tbaa !11
  %220 = add nuw nsw i32 %187, 8
  %221 = add i32 %188, 8
  %222 = icmp eq i32 %221, %43
  br i1 %222, label %223, label %186, !llvm.loop !18

223:                                              ; preds = %186, %184
  %224 = phi i32 [ 0, %184 ], [ %220, %186 ]
  br i1 %44, label %234, label %225

225:                                              ; preds = %223, %225
  %226 = phi i32 [ %231, %225 ], [ %224, %223 ]
  %227 = phi i32 [ %232, %225 ], [ 0, %223 ]
  %228 = add nsw i32 %226, %185
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %229
  store i32 %180, i32 addrspace(1)* %230, align 4, !tbaa !11
  %231 = add nuw nsw i32 %226, 1
  %232 = add i32 %227, 1
  %233 = icmp eq i32 %232, %41
  br i1 %233, label %234, label %225, !llvm.loop !19

234:                                              ; preds = %223, %225, %178
  %235 = zext i32 %48 to i64
  %236 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %235
  store i32 %179, i32 addrspace(1)* %236, align 4, !tbaa !11
  %237 = add nuw nsw i32 %48, %29
  %238 = icmp slt i32 %237, %2
  br i1 %238, label %45, label %63, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !14}
