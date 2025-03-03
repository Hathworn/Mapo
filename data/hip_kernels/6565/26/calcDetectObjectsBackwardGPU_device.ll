; ModuleID = '../data/hip_kernels/6565/26/main.cu'
source_filename = "../data/hip_kernels/6565/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28calcDetectObjectsBackwardGPUPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = icmp sgt i32 %7, 0
  br i1 %19, label %20, label %41

20:                                               ; preds = %9
  %21 = mul i32 %18, %17
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = mul i32 %24, %25
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %28 = add i32 %26, %27
  %29 = mul i32 %28, %17
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %5, %4
  %33 = mul nsw i32 %32, %6
  %34 = mul nsw i32 %33, %31
  %35 = icmp sgt i32 %8, 0
  %36 = add nsw i32 %8, 4
  %37 = and i32 %8, 1
  %38 = icmp eq i32 %8, 1
  %39 = and i32 %8, -2
  %40 = icmp eq i32 %37, 0
  br label %42

41:                                               ; preds = %174, %9
  ret void

42:                                               ; preds = %20, %174
  %43 = phi i32 [ 0, %20 ], [ %175, %174 ]
  %44 = add nsw i32 %43, %34
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = fneg contract float %47
  %49 = fmul float %47, 0xBFF7154760000000
  %50 = tail call float @llvm.rint.f32(float %49)
  %51 = fcmp olt float %47, 0xC0562E4300000000
  %52 = fcmp ogt float %47, 0x4059D1DA00000000
  %53 = fneg float %49
  %54 = tail call float @llvm.fma.f32(float %48, float 0x3FF7154760000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %48, float 0x3E54AE0BE0000000, float %54)
  %56 = fsub float %49, %50
  %57 = fadd float %55, %56
  %58 = tail call float @llvm.exp2.f32(float %57)
  %59 = fptosi float %50 to i32
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 %59)
  %61 = fadd contract float %60, 1.000000e+00
  %62 = fdiv contract float 1.000000e+00, %61
  %63 = select i1 %52, float 1.000000e+00, float %62
  %64 = select i1 %51, float 0.000000e+00, float %63
  %65 = fsub contract float 1.000000e+00, %64
  %66 = fmul contract float %64, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = fmul contract float %68, %66
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %69, float addrspace(1)* %70, align 4, !tbaa !16
  %71 = add nsw i32 %44, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = fneg contract float %74
  %76 = fmul float %74, 0xBFF7154760000000
  %77 = tail call float @llvm.rint.f32(float %76)
  %78 = fcmp olt float %74, 0xC0562E4300000000
  %79 = fcmp ogt float %74, 0x4059D1DA00000000
  %80 = fneg float %76
  %81 = tail call float @llvm.fma.f32(float %75, float 0x3FF7154760000000, float %80)
  %82 = tail call float @llvm.fma.f32(float %75, float 0x3E54AE0BE0000000, float %81)
  %83 = fsub float %76, %77
  %84 = fadd float %82, %83
  %85 = tail call float @llvm.exp2.f32(float %84)
  %86 = fptosi float %77 to i32
  %87 = tail call float @llvm.amdgcn.ldexp.f32(float %85, i32 %86)
  %88 = fadd contract float %87, 1.000000e+00
  %89 = fdiv contract float 1.000000e+00, %88
  %90 = select i1 %79, float 1.000000e+00, float %89
  %91 = select i1 %78, float 0.000000e+00, float %90
  %92 = fsub contract float 1.000000e+00, %91
  %93 = fmul contract float %91, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fmul contract float %95, %93
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %96, float addrspace(1)* %97, align 4, !tbaa !16
  %98 = add nsw i32 %44, 2
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16
  %102 = fmul float %101, 0x3FF7154760000000
  %103 = tail call float @llvm.rint.f32(float %102)
  %104 = fcmp ogt float %101, 0x40562E4300000000
  %105 = fcmp olt float %101, 0xC059D1DA00000000
  %106 = fneg float %102
  %107 = tail call float @llvm.fma.f32(float %101, float 0x3FF7154760000000, float %106)
  %108 = tail call float @llvm.fma.f32(float %101, float 0x3E54AE0BE0000000, float %107)
  %109 = fsub float %102, %103
  %110 = fadd float %108, %109
  %111 = tail call float @llvm.exp2.f32(float %110)
  %112 = fptosi float %103 to i32
  %113 = tail call float @llvm.amdgcn.ldexp.f32(float %111, i32 %112)
  %114 = select i1 %105, float 0.000000e+00, float %113
  %115 = select i1 %104, float 0x7FF0000000000000, float %114
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = fmul contract float %117, %115
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  store float %118, float addrspace(1)* %119, align 4, !tbaa !16
  %120 = add nsw i32 %44, 3
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = fmul float %123, 0x3FF7154760000000
  %125 = tail call float @llvm.rint.f32(float %124)
  %126 = fcmp ogt float %123, 0x40562E4300000000
  %127 = fcmp olt float %123, 0xC059D1DA00000000
  %128 = fneg float %124
  %129 = tail call float @llvm.fma.f32(float %123, float 0x3FF7154760000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %123, float 0x3E54AE0BE0000000, float %129)
  %131 = fsub float %124, %125
  %132 = fadd float %130, %131
  %133 = tail call float @llvm.exp2.f32(float %132)
  %134 = fptosi float %125 to i32
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 %134)
  %136 = select i1 %127, float 0.000000e+00, float %135
  %137 = select i1 %126, float 0x7FF0000000000000, float %136
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fmul contract float %139, %137
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  store float %140, float addrspace(1)* %141, align 4, !tbaa !16
  br i1 %35, label %142, label %174

142:                                              ; preds = %42
  %143 = add nsw i32 %44, 4
  br i1 %38, label %144, label %177

144:                                              ; preds = %177, %142
  %145 = phi i32 [ 0, %142 ], [ %235, %177 ]
  br i1 %40, label %174, label %146

146:                                              ; preds = %144
  %147 = add nsw i32 %143, %145
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = fneg contract float %150
  %152 = fmul float %150, 0xBFF7154760000000
  %153 = tail call float @llvm.rint.f32(float %152)
  %154 = fcmp olt float %150, 0xC0562E4300000000
  %155 = fcmp ogt float %150, 0x4059D1DA00000000
  %156 = fneg float %152
  %157 = tail call float @llvm.fma.f32(float %151, float 0x3FF7154760000000, float %156)
  %158 = tail call float @llvm.fma.f32(float %151, float 0x3E54AE0BE0000000, float %157)
  %159 = fsub float %152, %153
  %160 = fadd float %158, %159
  %161 = tail call float @llvm.exp2.f32(float %160)
  %162 = fptosi float %153 to i32
  %163 = tail call float @llvm.amdgcn.ldexp.f32(float %161, i32 %162)
  %164 = fadd contract float %163, 1.000000e+00
  %165 = fdiv contract float 1.000000e+00, %164
  %166 = select i1 %155, float 1.000000e+00, float %165
  %167 = select i1 %154, float 0.000000e+00, float %166
  %168 = fsub contract float 1.000000e+00, %167
  %169 = fmul contract float %167, %168
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16
  %172 = fmul contract float %171, %169
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  store float %172, float addrspace(1)* %173, align 4, !tbaa !16
  br label %174

174:                                              ; preds = %146, %144, %42
  %175 = add nsw i32 %36, %43
  %176 = icmp slt i32 %175, %7
  br i1 %176, label %42, label %41, !llvm.loop !20

177:                                              ; preds = %142, %177
  %178 = phi i32 [ %235, %177 ], [ 0, %142 ]
  %179 = phi i32 [ %236, %177 ], [ 0, %142 ]
  %180 = add nsw i32 %143, %178
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !16
  %184 = fneg contract float %183
  %185 = fmul float %183, 0xBFF7154760000000
  %186 = tail call float @llvm.rint.f32(float %185)
  %187 = fcmp olt float %183, 0xC0562E4300000000
  %188 = fcmp ogt float %183, 0x4059D1DA00000000
  %189 = fneg float %185
  %190 = tail call float @llvm.fma.f32(float %184, float 0x3FF7154760000000, float %189)
  %191 = tail call float @llvm.fma.f32(float %184, float 0x3E54AE0BE0000000, float %190)
  %192 = fsub float %185, %186
  %193 = fadd float %191, %192
  %194 = tail call float @llvm.exp2.f32(float %193)
  %195 = fptosi float %186 to i32
  %196 = tail call float @llvm.amdgcn.ldexp.f32(float %194, i32 %195)
  %197 = fadd contract float %196, 1.000000e+00
  %198 = fdiv contract float 1.000000e+00, %197
  %199 = select i1 %188, float 1.000000e+00, float %198
  %200 = select i1 %187, float 0.000000e+00, float %199
  %201 = fsub contract float 1.000000e+00, %200
  %202 = fmul contract float %200, %201
  %203 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !16
  %205 = fmul contract float %204, %202
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  store float %205, float addrspace(1)* %206, align 4, !tbaa !16
  %207 = or i32 %178, 1
  %208 = add nsw i32 %143, %207
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %2, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !16
  %212 = fneg contract float %211
  %213 = fmul float %211, 0xBFF7154760000000
  %214 = tail call float @llvm.rint.f32(float %213)
  %215 = fcmp olt float %211, 0xC0562E4300000000
  %216 = fcmp ogt float %211, 0x4059D1DA00000000
  %217 = fneg float %213
  %218 = tail call float @llvm.fma.f32(float %212, float 0x3FF7154760000000, float %217)
  %219 = tail call float @llvm.fma.f32(float %212, float 0x3E54AE0BE0000000, float %218)
  %220 = fsub float %213, %214
  %221 = fadd float %219, %220
  %222 = tail call float @llvm.exp2.f32(float %221)
  %223 = fptosi float %214 to i32
  %224 = tail call float @llvm.amdgcn.ldexp.f32(float %222, i32 %223)
  %225 = fadd contract float %224, 1.000000e+00
  %226 = fdiv contract float 1.000000e+00, %225
  %227 = select i1 %216, float 1.000000e+00, float %226
  %228 = select i1 %215, float 0.000000e+00, float %227
  %229 = fsub contract float 1.000000e+00, %228
  %230 = fmul contract float %228, %229
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !16
  %233 = fmul contract float %232, %230
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %209
  store float %233, float addrspace(1)* %234, align 4, !tbaa !16
  %235 = add nuw nsw i32 %178, 2
  %236 = add i32 %179, 2
  %237 = icmp eq i32 %236, %39
  br i1 %237, label %144, label %177, !llvm.loop !22
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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
