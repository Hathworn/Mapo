; ModuleID = '../data/hip_kernels/4085/10/main.cu'
source_filename = "../data/hip_kernels/4085/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14softmax_kerneliiiPffS_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %2
  br i1 %27, label %28, label %259

28:                                               ; preds = %6
  %29 = mul nsw i32 %26, %1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  %33 = icmp sgt i32 %0, 0
  br i1 %33, label %34, label %58

34:                                               ; preds = %28
  %35 = and i32 %0, 7
  %36 = icmp ult i32 %0, 8
  br i1 %36, label %39, label %37

37:                                               ; preds = %34
  %38 = and i32 %0, -8
  br label %66

39:                                               ; preds = %66, %34
  %40 = phi float [ undef, %34 ], [ %132, %66 ]
  %41 = phi i32 [ 0, %34 ], [ %133, %66 ]
  %42 = phi float [ 0xFFF0000000000000, %34 ], [ %132, %66 ]
  %43 = icmp eq i32 %35, 0
  br i1 %43, label %58, label %44

44:                                               ; preds = %39, %44
  %45 = phi i32 [ %55, %44 ], [ %41, %39 ]
  %46 = phi float [ %54, %44 ], [ %42, %39 ]
  %47 = phi i32 [ %56, %44 ], [ 0, %39 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %31, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !14
  %51 = fptosi float %50 to i32
  %52 = sitofp i32 %51 to float
  %53 = fcmp contract olt float %46, %52
  %54 = select contract i1 %53, float %52, float %46
  %55 = add nuw nsw i32 %45, 1
  %56 = add i32 %47, 1
  %57 = icmp eq i32 %56, %35
  br i1 %57, label %58, label %44, !llvm.loop !20

58:                                               ; preds = %39, %44, %28
  %59 = phi float [ 0xFFF0000000000000, %28 ], [ %40, %39 ], [ %54, %44 ]
  br i1 %33, label %60, label %164

60:                                               ; preds = %58
  %61 = fdiv contract float %59, %4
  %62 = and i32 %0, 1
  %63 = icmp eq i32 %0, 1
  br i1 %63, label %138, label %64

64:                                               ; preds = %60
  %65 = and i32 %0, -2
  br label %171

66:                                               ; preds = %66, %37
  %67 = phi i32 [ 0, %37 ], [ %133, %66 ]
  %68 = phi float [ 0xFFF0000000000000, %37 ], [ %132, %66 ]
  %69 = phi i32 [ 0, %37 ], [ %134, %66 ]
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %31, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !14
  %73 = fptosi float %72 to i32
  %74 = sitofp i32 %73 to float
  %75 = fcmp contract olt float %68, %74
  %76 = select contract i1 %75, float %74, float %68
  %77 = or i32 %67, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %31, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !14
  %81 = fptosi float %80 to i32
  %82 = sitofp i32 %81 to float
  %83 = fcmp contract olt float %76, %82
  %84 = select contract i1 %83, float %82, float %76
  %85 = or i32 %67, 2
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %31, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !14
  %89 = fptosi float %88 to i32
  %90 = sitofp i32 %89 to float
  %91 = fcmp contract olt float %84, %90
  %92 = select contract i1 %91, float %90, float %84
  %93 = or i32 %67, 3
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %31, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !14
  %97 = fptosi float %96 to i32
  %98 = sitofp i32 %97 to float
  %99 = fcmp contract olt float %92, %98
  %100 = select contract i1 %99, float %98, float %92
  %101 = or i32 %67, 4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %31, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !14
  %105 = fptosi float %104 to i32
  %106 = sitofp i32 %105 to float
  %107 = fcmp contract olt float %100, %106
  %108 = select contract i1 %107, float %106, float %100
  %109 = or i32 %67, 5
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %31, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16, !amdgpu.noclobber !14
  %113 = fptosi float %112 to i32
  %114 = sitofp i32 %113 to float
  %115 = fcmp contract olt float %108, %114
  %116 = select contract i1 %115, float %114, float %108
  %117 = or i32 %67, 6
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %31, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16, !amdgpu.noclobber !14
  %121 = fptosi float %120 to i32
  %122 = sitofp i32 %121 to float
  %123 = fcmp contract olt float %116, %122
  %124 = select contract i1 %123, float %122, float %116
  %125 = or i32 %67, 7
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %31, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !14
  %129 = fptosi float %128 to i32
  %130 = sitofp i32 %129 to float
  %131 = fcmp contract olt float %124, %130
  %132 = select contract i1 %131, float %130, float %124
  %133 = add nuw nsw i32 %67, 8
  %134 = add i32 %69, 8
  %135 = icmp eq i32 %134, %38
  br i1 %135, label %39, label %66, !llvm.loop !22

136:                                              ; preds = %171
  %137 = zext i32 %218 to i64
  br label %138

138:                                              ; preds = %136, %60
  %139 = phi float [ undef, %60 ], [ %216, %136 ]
  %140 = phi i64 [ 0, %60 ], [ %137, %136 ]
  %141 = phi float [ 0.000000e+00, %60 ], [ %216, %136 ]
  %142 = icmp eq i32 %62, 0
  br i1 %142, label %164, label %143

143:                                              ; preds = %138
  %144 = getelementptr inbounds float, float addrspace(1)* %31, i64 %140
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %146 = fdiv contract float %145, %4
  %147 = fsub contract float %146, %61
  %148 = fmul float %147, 0x3FF7154760000000
  %149 = tail call float @llvm.rint.f32(float %148)
  %150 = fcmp ogt float %147, 0x40562E4300000000
  %151 = fcmp olt float %147, 0xC059D1DA00000000
  %152 = fneg float %148
  %153 = tail call float @llvm.fma.f32(float %147, float 0x3FF7154760000000, float %152)
  %154 = tail call float @llvm.fma.f32(float %147, float 0x3E54AE0BE0000000, float %153)
  %155 = fsub float %148, %149
  %156 = fadd float %154, %155
  %157 = tail call float @llvm.exp2.f32(float %156)
  %158 = fptosi float %149 to i32
  %159 = tail call float @llvm.amdgcn.ldexp.f32(float %157, i32 %158)
  %160 = select i1 %151, float 0.000000e+00, float %159
  %161 = select i1 %150, float 0x7FF0000000000000, float %160
  %162 = fadd contract float %141, %161
  %163 = getelementptr inbounds float, float addrspace(1)* %32, i64 %140
  store float %161, float addrspace(1)* %163, align 4, !tbaa !16
  br label %164

164:                                              ; preds = %143, %138, %58
  %165 = phi float [ 0.000000e+00, %58 ], [ %139, %138 ], [ %162, %143 ]
  br i1 %33, label %166, label %259

166:                                              ; preds = %164
  %167 = and i32 %0, 3
  %168 = icmp ult i32 %0, 4
  br i1 %168, label %246, label %169

169:                                              ; preds = %166
  %170 = and i32 %0, -4
  br label %221

171:                                              ; preds = %171, %64
  %172 = phi i32 [ 0, %64 ], [ %218, %171 ]
  %173 = phi float [ 0.000000e+00, %64 ], [ %216, %171 ]
  %174 = phi i32 [ 0, %64 ], [ %219, %171 ]
  %175 = zext i32 %172 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %31, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16
  %178 = fdiv contract float %177, %4
  %179 = fsub contract float %178, %61
  %180 = fmul float %179, 0x3FF7154760000000
  %181 = tail call float @llvm.rint.f32(float %180)
  %182 = fcmp ogt float %179, 0x40562E4300000000
  %183 = fcmp olt float %179, 0xC059D1DA00000000
  %184 = fneg float %180
  %185 = tail call float @llvm.fma.f32(float %179, float 0x3FF7154760000000, float %184)
  %186 = tail call float @llvm.fma.f32(float %179, float 0x3E54AE0BE0000000, float %185)
  %187 = fsub float %180, %181
  %188 = fadd float %186, %187
  %189 = tail call float @llvm.exp2.f32(float %188)
  %190 = fptosi float %181 to i32
  %191 = tail call float @llvm.amdgcn.ldexp.f32(float %189, i32 %190)
  %192 = select i1 %183, float 0.000000e+00, float %191
  %193 = select i1 %182, float 0x7FF0000000000000, float %192
  %194 = fadd contract float %173, %193
  %195 = getelementptr inbounds float, float addrspace(1)* %32, i64 %175
  store float %193, float addrspace(1)* %195, align 4, !tbaa !16
  %196 = or i32 %172, 1
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %31, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !16
  %200 = fdiv contract float %199, %4
  %201 = fsub contract float %200, %61
  %202 = fmul float %201, 0x3FF7154760000000
  %203 = tail call float @llvm.rint.f32(float %202)
  %204 = fcmp ogt float %201, 0x40562E4300000000
  %205 = fcmp olt float %201, 0xC059D1DA00000000
  %206 = fneg float %202
  %207 = tail call float @llvm.fma.f32(float %201, float 0x3FF7154760000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %201, float 0x3E54AE0BE0000000, float %207)
  %209 = fsub float %202, %203
  %210 = fadd float %208, %209
  %211 = tail call float @llvm.exp2.f32(float %210)
  %212 = fptosi float %203 to i32
  %213 = tail call float @llvm.amdgcn.ldexp.f32(float %211, i32 %212)
  %214 = select i1 %205, float 0.000000e+00, float %213
  %215 = select i1 %204, float 0x7FF0000000000000, float %214
  %216 = fadd contract float %194, %215
  %217 = getelementptr inbounds float, float addrspace(1)* %32, i64 %197
  store float %215, float addrspace(1)* %217, align 4, !tbaa !16
  %218 = add nuw nsw i32 %172, 2
  %219 = add i32 %174, 2
  %220 = icmp eq i32 %219, %65
  br i1 %220, label %136, label %171, !llvm.loop !24

221:                                              ; preds = %221, %169
  %222 = phi i32 [ 0, %169 ], [ %243, %221 ]
  %223 = phi i32 [ 0, %169 ], [ %244, %221 ]
  %224 = zext i32 %222 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %32, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !16
  %227 = fdiv contract float %226, %165
  store float %227, float addrspace(1)* %225, align 4, !tbaa !16
  %228 = or i32 %222, 1
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %32, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !16
  %232 = fdiv contract float %231, %165
  store float %232, float addrspace(1)* %230, align 4, !tbaa !16
  %233 = or i32 %222, 2
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %32, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !16
  %237 = fdiv contract float %236, %165
  store float %237, float addrspace(1)* %235, align 4, !tbaa !16
  %238 = or i32 %222, 3
  %239 = zext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %32, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !16
  %242 = fdiv contract float %241, %165
  store float %242, float addrspace(1)* %240, align 4, !tbaa !16
  %243 = add nuw nsw i32 %222, 4
  %244 = add i32 %223, 4
  %245 = icmp eq i32 %244, %170
  br i1 %245, label %246, label %221, !llvm.loop !25

246:                                              ; preds = %221, %166
  %247 = phi i32 [ 0, %166 ], [ %243, %221 ]
  %248 = icmp eq i32 %167, 0
  br i1 %248, label %259, label %249

249:                                              ; preds = %246, %249
  %250 = phi i32 [ %256, %249 ], [ %247, %246 ]
  %251 = phi i32 [ %257, %249 ], [ 0, %246 ]
  %252 = zext i32 %250 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %32, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !16
  %255 = fdiv contract float %254, %165
  store float %255, float addrspace(1)* %253, align 4, !tbaa !16
  %256 = add nuw nsw i32 %250, 1
  %257 = add i32 %251, 1
  %258 = icmp eq i32 %257, %167
  br i1 %258, label %259, label %249, !llvm.loop !26

259:                                              ; preds = %246, %249, %164, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !21}
