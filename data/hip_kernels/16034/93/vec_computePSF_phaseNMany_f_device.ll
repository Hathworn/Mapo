; ModuleID = '../data/hip_kernels/16034/93/main.cu'
source_filename = "../data/hip_kernels/16034/93/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phaseNMany_f(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture writeonly %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = add i32 %30, %24
  %32 = udiv i32 %23, %20
  %33 = mul i32 %32, %20
  %34 = icmp ugt i32 %23, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %31
  %38 = add i32 %37, %15
  %39 = mul i32 %38, %20
  %40 = add i32 %39, %14
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %42, label %271

42:                                               ; preds = %13
  %43 = freeze i32 %40
  %44 = freeze i32 %1
  %45 = sdiv i32 %43, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %43, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !6
  %51 = sext i32 %45 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %8, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !6
  %54 = fmul contract float %50, %53
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !6
  %57 = add nsw i32 %45, %12
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %8, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16, !amdgpu.noclobber !6
  %61 = fmul contract float %56, %60
  %62 = fadd contract float %54, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16, !amdgpu.noclobber !6
  %65 = shl nsw i32 %12, 1
  %66 = add nsw i32 %45, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %8, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !6
  %70 = fmul contract float %64, %69
  %71 = fadd contract float %62, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !6
  %74 = fadd contract float %73, %71
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %48
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !6
  %77 = tail call float @llvm.fabs.f32(float %74)
  %78 = fcmp olt float %77, 1.310720e+05
  br i1 %78, label %79, label %114

79:                                               ; preds = %42
  %80 = fmul float %77, 0x3FE45F3060000000
  %81 = tail call float @llvm.rint.f32(float %80)
  %82 = tail call float @llvm.fma.f32(float %81, float 0xBFF921FB40000000, float %77)
  %83 = tail call float @llvm.fma.f32(float %81, float 0xBE74442D00000000, float %82)
  %84 = tail call float @llvm.fma.f32(float %81, float 0xBCF8469880000000, float %83)
  %85 = fptosi float %81 to i32
  %86 = fmul float %84, %84
  %87 = tail call float @llvm.fmuladd.f32(float %86, float 0xBF29833040000000, float 0x3F81103880000000)
  %88 = tail call float @llvm.fmuladd.f32(float %86, float %87, float 0xBFC55553A0000000)
  %89 = fmul float %86, %88
  %90 = tail call float @llvm.fmuladd.f32(float %84, float %89, float %84)
  %91 = tail call float @llvm.fmuladd.f32(float %86, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %92 = tail call float @llvm.fmuladd.f32(float %86, float %91, float 0x3FA5557EE0000000)
  %93 = tail call float @llvm.fmuladd.f32(float %86, float %92, float 0xBFE0000080000000)
  %94 = tail call float @llvm.fmuladd.f32(float %86, float %93, float 1.000000e+00)
  %95 = fneg float %90
  %96 = and i32 %85, 1
  %97 = icmp eq i32 %96, 0
  %98 = select i1 %97, float %94, float %95
  %99 = bitcast float %98 to i32
  %100 = shl i32 %85, 30
  %101 = and i32 %100, -2147483648
  %102 = xor i32 %101, %99
  %103 = bitcast i32 %102 to float
  %104 = tail call i1 @llvm.amdgcn.class.f32(float %77, i32 504)
  %105 = select i1 %104, float %103, float 0x7FF8000000000000
  %106 = fmul contract float %76, %105
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !20, !amdgpu.noclobber !6
  %109 = mul nsw i32 %45, %2
  %110 = add nsw i32 %108, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %11, i64 %111
  store float %106, float addrspace(1)* %112, align 4, !tbaa !16
  %113 = bitcast float %77 to i32
  br label %247

114:                                              ; preds = %42
  %115 = bitcast float %77 to i32
  %116 = lshr i32 %115, 23
  %117 = and i32 %115, 8388607
  %118 = or i32 %117, 8388608
  %119 = zext i32 %118 to i64
  %120 = mul nuw nsw i64 %119, 4266746795
  %121 = trunc i64 %120 to i32
  %122 = lshr i64 %120, 32
  %123 = mul nuw nsw i64 %119, 1011060801
  %124 = add nuw nsw i64 %122, %123
  %125 = trunc i64 %124 to i32
  %126 = lshr i64 %124, 32
  %127 = mul nuw nsw i64 %119, 3680671129
  %128 = add nuw nsw i64 %126, %127
  %129 = trunc i64 %128 to i32
  %130 = lshr i64 %128, 32
  %131 = mul nuw nsw i64 %119, 4113882560
  %132 = add nuw nsw i64 %130, %131
  %133 = trunc i64 %132 to i32
  %134 = lshr i64 %132, 32
  %135 = mul nuw nsw i64 %119, 4230436817
  %136 = add nuw nsw i64 %134, %135
  %137 = trunc i64 %136 to i32
  %138 = lshr i64 %136, 32
  %139 = mul nuw nsw i64 %119, 1313084713
  %140 = add nuw nsw i64 %138, %139
  %141 = trunc i64 %140 to i32
  %142 = lshr i64 %140, 32
  %143 = mul nuw nsw i64 %119, 2734261102
  %144 = add nuw nsw i64 %142, %143
  %145 = trunc i64 %144 to i32
  %146 = lshr i64 %144, 32
  %147 = trunc i64 %146 to i32
  %148 = add nsw i32 %116, -120
  %149 = icmp ugt i32 %148, 63
  %150 = select i1 %149, i32 %141, i32 %147
  %151 = select i1 %149, i32 %137, i32 %145
  %152 = select i1 %149, i32 %133, i32 %141
  %153 = select i1 %149, i32 %129, i32 %137
  %154 = select i1 %149, i32 %125, i32 %133
  %155 = select i1 %149, i32 %121, i32 %129
  %156 = select i1 %149, i32 -64, i32 0
  %157 = add nsw i32 %156, %148
  %158 = icmp ugt i32 %157, 31
  %159 = select i1 %158, i32 %151, i32 %150
  %160 = select i1 %158, i32 %152, i32 %151
  %161 = select i1 %158, i32 %153, i32 %152
  %162 = select i1 %158, i32 %154, i32 %153
  %163 = select i1 %158, i32 %155, i32 %154
  %164 = select i1 %158, i32 -32, i32 0
  %165 = add nsw i32 %164, %157
  %166 = icmp ugt i32 %165, 31
  %167 = select i1 %166, i32 %160, i32 %159
  %168 = select i1 %166, i32 %161, i32 %160
  %169 = select i1 %166, i32 %162, i32 %161
  %170 = select i1 %166, i32 %163, i32 %162
  %171 = select i1 %166, i32 -32, i32 0
  %172 = add nsw i32 %171, %165
  %173 = icmp eq i32 %172, 0
  %174 = sub nsw i32 32, %172
  %175 = tail call i32 @llvm.fshr.i32(i32 %167, i32 %168, i32 %174)
  %176 = tail call i32 @llvm.fshr.i32(i32 %168, i32 %169, i32 %174)
  %177 = tail call i32 @llvm.fshr.i32(i32 %169, i32 %170, i32 %174)
  %178 = select i1 %173, i32 %167, i32 %175
  %179 = select i1 %173, i32 %168, i32 %176
  %180 = select i1 %173, i32 %169, i32 %177
  %181 = lshr i32 %178, 29
  %182 = tail call i32 @llvm.fshl.i32(i32 %178, i32 %179, i32 2)
  %183 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %180, i32 2)
  %184 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %170, i32 2)
  %185 = and i32 %181, 1
  %186 = sub nsw i32 0, %185
  %187 = shl i32 %181, 31
  %188 = xor i32 %182, %186
  %189 = xor i32 %183, %186
  %190 = xor i32 %184, %186
  %191 = tail call i32 @llvm.ctlz.i32(i32 %188, i1 false), !range !22
  %192 = sub nsw i32 31, %191
  %193 = tail call i32 @llvm.fshr.i32(i32 %188, i32 %189, i32 %192)
  %194 = tail call i32 @llvm.fshr.i32(i32 %189, i32 %190, i32 %192)
  %195 = shl nuw nsw i32 %191, 23
  %196 = sub nuw nsw i32 1056964608, %195
  %197 = lshr i32 %193, 9
  %198 = or i32 %197, %196
  %199 = or i32 %198, %187
  %200 = bitcast i32 %199 to float
  %201 = tail call i32 @llvm.fshl.i32(i32 %193, i32 %194, i32 23)
  %202 = tail call i32 @llvm.ctlz.i32(i32 %201, i1 false), !range !22
  %203 = fmul float %200, 0x3FF921FB40000000
  %204 = add nuw nsw i32 %202, %191
  %205 = shl nuw nsw i32 %204, 23
  %206 = sub nuw nsw i32 855638016, %205
  %207 = sub nsw i32 31, %202
  %208 = tail call i32 @llvm.fshr.i32(i32 %201, i32 %194, i32 %207)
  %209 = lshr i32 %208, 9
  %210 = or i32 %206, %209
  %211 = or i32 %210, %187
  %212 = bitcast i32 %211 to float
  %213 = fneg float %203
  %214 = tail call float @llvm.fma.f32(float %200, float 0x3FF921FB40000000, float %213)
  %215 = tail call float @llvm.fma.f32(float %200, float 0x3E74442D00000000, float %214)
  %216 = tail call float @llvm.fma.f32(float %212, float 0x3FF921FB40000000, float %215)
  %217 = fadd float %203, %216
  %218 = lshr i32 %178, 30
  %219 = add nuw nsw i32 %185, %218
  %220 = fmul float %217, %217
  %221 = tail call float @llvm.fmuladd.f32(float %220, float 0xBF29833040000000, float 0x3F81103880000000)
  %222 = tail call float @llvm.fmuladd.f32(float %220, float %221, float 0xBFC55553A0000000)
  %223 = fmul float %220, %222
  %224 = tail call float @llvm.fmuladd.f32(float %217, float %223, float %217)
  %225 = tail call float @llvm.fmuladd.f32(float %220, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %226 = tail call float @llvm.fmuladd.f32(float %220, float %225, float 0x3FA5557EE0000000)
  %227 = tail call float @llvm.fmuladd.f32(float %220, float %226, float 0xBFE0000080000000)
  %228 = tail call float @llvm.fmuladd.f32(float %220, float %227, float 1.000000e+00)
  %229 = fneg float %224
  %230 = and i32 %219, 1
  %231 = icmp eq i32 %230, 0
  %232 = select i1 %231, float %228, float %229
  %233 = bitcast float %232 to i32
  %234 = shl i32 %219, 30
  %235 = and i32 %234, -2147483648
  %236 = xor i32 %235, %233
  %237 = bitcast i32 %236 to float
  %238 = tail call i1 @llvm.amdgcn.class.f32(float %77, i32 504)
  %239 = select i1 %238, float %237, float 0x7FF8000000000000
  %240 = fmul contract float %76, %239
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  %242 = load i32, i32 addrspace(1)* %241, align 4, !tbaa !20, !amdgpu.noclobber !6
  %243 = mul nsw i32 %45, %2
  %244 = add nsw i32 %242, %243
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %11, i64 %245
  store float %240, float addrspace(1)* %246, align 4, !tbaa !16
  br label %247

247:                                              ; preds = %79, %114
  %248 = phi i32 [ %101, %79 ], [ %235, %114 ]
  %249 = phi i32 [ %96, %79 ], [ %230, %114 ]
  %250 = phi float [ %94, %79 ], [ %228, %114 ]
  %251 = phi float [ %90, %79 ], [ %224, %114 ]
  %252 = phi i32 [ %109, %79 ], [ %243, %114 ]
  %253 = phi i1 [ %104, %79 ], [ %238, %114 ]
  %254 = phi i32 [ %113, %79 ], [ %115, %114 ]
  %255 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %256 = icmp eq i32 %249, 0
  %257 = select i1 %256, float %251, float %250
  %258 = bitcast float %257 to i32
  %259 = bitcast float %74 to i32
  %260 = xor i32 %254, %259
  %261 = xor i32 %260, %248
  %262 = xor i32 %261, %258
  %263 = bitcast i32 %262 to float
  %264 = select i1 %253, float %263, float 0x7FF8000000000000
  %265 = fmul contract float %255, %264
  %266 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %48
  %267 = load i32, i32 addrspace(1)* %266, align 4, !tbaa !20, !amdgpu.noclobber !6
  %268 = add nsw i32 %267, %252
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %11, i64 %269
  store float %265, float addrspace(1)* %270, align 4, !tbaa !16
  br label %271

271:                                              ; preds = %247, %13
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{i32 0, i32 33}
