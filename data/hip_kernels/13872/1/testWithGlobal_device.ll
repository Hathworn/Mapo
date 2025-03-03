; ModuleID = '../data/hip_kernels/13872/1/main.cu'
source_filename = "../data/hip_kernels/13872/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14testWithGlobaliiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %259

15:                                               ; preds = %4
  %16 = mul nsw i32 %13, %1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  %19 = icmp sgt i32 %1, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %15
  %21 = sitofp i32 %13 to float
  br label %31

22:                                               ; preds = %152, %15
  %23 = sdiv i32 %1, 2
  %24 = icmp sgt i32 %1, 1
  br i1 %24, label %25, label %255

25:                                               ; preds = %22
  %26 = add nsw i32 %23, -1
  %27 = and i32 %23, 7
  %28 = icmp ult i32 %26, 7
  br i1 %28, label %225, label %29

29:                                               ; preds = %25
  %30 = and i32 %23, -8
  br label %180

31:                                               ; preds = %152, %20
  %32 = phi i32 [ 0, %20 ], [ %178, %152 ]
  %33 = phi float [ 0.000000e+00, %20 ], [ %175, %152 ]
  %34 = sitofp i32 %32 to float
  %35 = fmul contract float %34, 0x3FB99999A0000000
  %36 = fmul contract float %35, %21
  %37 = tail call float @llvm.fabs.f32(float %36)
  %38 = fcmp olt float %37, 1.310720e+05
  br i1 %38, label %39, label %46

39:                                               ; preds = %31
  %40 = fmul float %37, 0x3FE45F3060000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = tail call float @llvm.fma.f32(float %41, float 0xBFF921FB40000000, float %37)
  %43 = tail call float @llvm.fma.f32(float %41, float 0xBE74442D00000000, float %42)
  %44 = tail call float @llvm.fma.f32(float %41, float 0xBCF8469880000000, float %43)
  %45 = fptosi float %41 to i32
  br label %152

46:                                               ; preds = %31
  %47 = bitcast float %37 to i32
  %48 = lshr i32 %47, 23
  %49 = and i32 %47, 8388607
  %50 = or i32 %49, 8388608
  %51 = zext i32 %50 to i64
  %52 = mul nuw nsw i64 %51, 4266746795
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %51, 1011060801
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %51, 3680671129
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %51, 4113882560
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %51, 4230436817
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %51, 1313084713
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %51, 2734261102
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = trunc i64 %78 to i32
  %80 = add nsw i32 %48, -120
  %81 = icmp ugt i32 %80, 63
  %82 = select i1 %81, i32 %73, i32 %79
  %83 = select i1 %81, i32 %69, i32 %77
  %84 = select i1 %81, i32 %65, i32 %73
  %85 = select i1 %81, i32 %61, i32 %69
  %86 = select i1 %81, i32 %57, i32 %65
  %87 = select i1 %81, i32 %53, i32 %61
  %88 = select i1 %81, i32 -64, i32 0
  %89 = add nsw i32 %88, %80
  %90 = icmp ugt i32 %89, 31
  %91 = select i1 %90, i32 %83, i32 %82
  %92 = select i1 %90, i32 %84, i32 %83
  %93 = select i1 %90, i32 %85, i32 %84
  %94 = select i1 %90, i32 %86, i32 %85
  %95 = select i1 %90, i32 %87, i32 %86
  %96 = select i1 %90, i32 -32, i32 0
  %97 = add nsw i32 %96, %89
  %98 = icmp ugt i32 %97, 31
  %99 = select i1 %98, i32 %92, i32 %91
  %100 = select i1 %98, i32 %93, i32 %92
  %101 = select i1 %98, i32 %94, i32 %93
  %102 = select i1 %98, i32 %95, i32 %94
  %103 = select i1 %98, i32 -32, i32 0
  %104 = add nsw i32 %103, %97
  %105 = icmp eq i32 %104, 0
  %106 = sub nsw i32 32, %104
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %106)
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %106)
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %106)
  %110 = select i1 %105, i32 %99, i32 %107
  %111 = select i1 %105, i32 %100, i32 %108
  %112 = select i1 %105, i32 %101, i32 %109
  %113 = lshr i32 %110, 29
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %111, i32 2)
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 2)
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %102, i32 2)
  %117 = and i32 %113, 1
  %118 = sub nsw i32 0, %117
  %119 = shl i32 %113, 31
  %120 = xor i32 %114, %118
  %121 = xor i32 %115, %118
  %122 = xor i32 %116, %118
  %123 = tail call i32 @llvm.ctlz.i32(i32 %120, i1 false), !range !7
  %124 = sub nsw i32 31, %123
  %125 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %124)
  %126 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %124)
  %127 = shl nuw nsw i32 %123, 23
  %128 = sub nuw nsw i32 1056964608, %127
  %129 = lshr i32 %125, 9
  %130 = or i32 %129, %128
  %131 = or i32 %130, %119
  %132 = bitcast i32 %131 to float
  %133 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %126, i32 23)
  %134 = tail call i32 @llvm.ctlz.i32(i32 %133, i1 false), !range !7
  %135 = fmul float %132, 0x3FF921FB40000000
  %136 = add nuw nsw i32 %134, %123
  %137 = shl nuw nsw i32 %136, 23
  %138 = sub nuw nsw i32 855638016, %137
  %139 = sub nsw i32 31, %134
  %140 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %126, i32 %139)
  %141 = lshr i32 %140, 9
  %142 = or i32 %138, %141
  %143 = or i32 %142, %119
  %144 = bitcast i32 %143 to float
  %145 = fneg float %135
  %146 = tail call float @llvm.fma.f32(float %132, float 0x3FF921FB40000000, float %145)
  %147 = tail call float @llvm.fma.f32(float %132, float 0x3E74442D00000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %144, float 0x3FF921FB40000000, float %147)
  %149 = fadd float %135, %148
  %150 = lshr i32 %110, 30
  %151 = add nuw nsw i32 %117, %150
  br label %152

152:                                              ; preds = %46, %39
  %153 = phi float [ %44, %39 ], [ %149, %46 ]
  %154 = phi i32 [ %45, %39 ], [ %151, %46 ]
  %155 = fmul float %153, %153
  %156 = tail call float @llvm.fmuladd.f32(float %155, float 0xBF29833040000000, float 0x3F81103880000000)
  %157 = tail call float @llvm.fmuladd.f32(float %155, float %156, float 0xBFC55553A0000000)
  %158 = fmul float %155, %157
  %159 = tail call float @llvm.fmuladd.f32(float %153, float %158, float %153)
  %160 = tail call float @llvm.fmuladd.f32(float %155, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %161 = tail call float @llvm.fmuladd.f32(float %155, float %160, float 0x3FA5557EE0000000)
  %162 = tail call float @llvm.fmuladd.f32(float %155, float %161, float 0xBFE0000080000000)
  %163 = tail call float @llvm.fmuladd.f32(float %155, float %162, float 1.000000e+00)
  %164 = fneg float %159
  %165 = and i32 %154, 1
  %166 = icmp eq i32 %165, 0
  %167 = select i1 %166, float %163, float %164
  %168 = bitcast float %167 to i32
  %169 = shl i32 %154, 30
  %170 = and i32 %169, -2147483648
  %171 = xor i32 %170, %168
  %172 = bitcast i32 %171 to float
  %173 = tail call i1 @llvm.amdgcn.class.f32(float %37, i32 504)
  %174 = select i1 %173, float %172, float 0x7FF8000000000000
  %175 = fadd contract float %33, %174
  %176 = zext i32 %32 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %18, i64 %176
  store float %175, float addrspace(1)* %177, align 4, !tbaa !8
  %178 = add nuw nsw i32 %32, 1
  %179 = icmp eq i32 %178, %1
  br i1 %179, label %22, label %31, !llvm.loop !12

180:                                              ; preds = %180, %29
  %181 = phi i32 [ 0, %29 ], [ %222, %180 ]
  %182 = phi i32 [ 0, %29 ], [ %223, %180 ]
  %183 = zext i32 %181 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %18, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !8
  %186 = fmul contract float %185, %185
  store float %186, float addrspace(1)* %184, align 4, !tbaa !8
  %187 = or i32 %181, 1
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %18, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !8
  %191 = fmul contract float %190, %190
  store float %191, float addrspace(1)* %189, align 4, !tbaa !8
  %192 = or i32 %181, 2
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %18, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !8
  %196 = fmul contract float %195, %195
  store float %196, float addrspace(1)* %194, align 4, !tbaa !8
  %197 = or i32 %181, 3
  %198 = zext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %18, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !8
  %201 = fmul contract float %200, %200
  store float %201, float addrspace(1)* %199, align 4, !tbaa !8
  %202 = or i32 %181, 4
  %203 = zext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %18, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !8
  %206 = fmul contract float %205, %205
  store float %206, float addrspace(1)* %204, align 4, !tbaa !8
  %207 = or i32 %181, 5
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %18, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !8
  %211 = fmul contract float %210, %210
  store float %211, float addrspace(1)* %209, align 4, !tbaa !8
  %212 = or i32 %181, 6
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %18, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !8
  %216 = fmul contract float %215, %215
  store float %216, float addrspace(1)* %214, align 4, !tbaa !8
  %217 = or i32 %181, 7
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %18, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !8
  %221 = fmul contract float %220, %220
  store float %221, float addrspace(1)* %219, align 4, !tbaa !8
  %222 = add nuw nsw i32 %181, 8
  %223 = add i32 %182, 8
  %224 = icmp eq i32 %223, %30
  br i1 %224, label %225, label %180, !llvm.loop !14

225:                                              ; preds = %180, %25
  %226 = phi i32 [ 0, %25 ], [ %222, %180 ]
  %227 = icmp eq i32 %27, 0
  br i1 %227, label %238, label %228

228:                                              ; preds = %225, %228
  %229 = phi i32 [ %235, %228 ], [ %226, %225 ]
  %230 = phi i32 [ %236, %228 ], [ 0, %225 ]
  %231 = zext i32 %229 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %18, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !8
  %234 = fmul contract float %233, %233
  store float %234, float addrspace(1)* %232, align 4, !tbaa !8
  %235 = add nuw nsw i32 %229, 1
  %236 = add i32 %230, 1
  %237 = icmp eq i32 %236, %27
  br i1 %237, label %238, label %228, !llvm.loop !15

238:                                              ; preds = %228, %225
  br label %239

239:                                              ; preds = %238, %239
  %240 = phi i32 [ %242, %239 ], [ %1, %238 ]
  %241 = phi float [ %253, %239 ], [ 0.000000e+00, %238 ]
  %242 = add nsw i32 %240, -1
  %243 = add nsw i32 %240, -2
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %18, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !8
  %247 = zext i32 %242 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %18, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !8
  %250 = tail call float @llvm.fabs.f32(float %249)
  %251 = fadd contract float %250, 0x3FB99999A0000000
  %252 = fdiv contract float %246, %251
  %253 = fadd contract float %241, %252
  %254 = icmp ugt i32 %240, 2
  br i1 %254, label %239, label %255, !llvm.loop !17

255:                                              ; preds = %239, %22
  %256 = phi float [ 0.000000e+00, %22 ], [ %253, %239 ]
  %257 = sext i32 %13 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %2, i64 %257
  store float %256, float addrspace(1)* %258, align 4, !tbaa !8
  br label %259

259:                                              ; preds = %255, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !13}
