; ModuleID = '../data/hip_kernels/5954/1/main.cu'
source_filename = "../data/hip_kernels/5954/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23ExpProbPolynomProbsImplPKfiPKiS0_S2_ifPf(float addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp ult i32 %9, %1
  br i1 %10, label %11, label %224

11:                                               ; preds = %8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = zext i32 %9 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %7, i64 %13
  %16 = icmp slt i32 %12, %5
  br i1 %16, label %17, label %224

17:                                               ; preds = %11
  %18 = fneg contract float %6
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !14, !invariant.load !15
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  br label %31

31:                                               ; preds = %17, %216
  %32 = phi i32 [ %12, %17 ], [ %222, %216 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !15
  %36 = add nsw i32 %32, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !15
  %40 = sub nsw i32 %39, %35
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %101

42:                                               ; preds = %31
  %43 = sext i32 %35 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %45 = add i32 %35, 1
  %46 = and i32 %40, 1
  %47 = icmp eq i32 %39, %45
  br i1 %47, label %50, label %48

48:                                               ; preds = %42
  %49 = and i32 %40, -2
  br label %104

50:                                               ; preds = %195, %42
  %51 = phi i1 [ undef, %42 ], [ %196, %195 ]
  %52 = phi float [ undef, %42 ], [ %197, %195 ]
  %53 = phi float [ 0.000000e+00, %42 ], [ %197, %195 ]
  %54 = phi i1 [ false, %42 ], [ %196, %195 ]
  %55 = phi i32 [ 0, %42 ], [ %198, %195 ]
  %56 = icmp eq i32 %46, 0
  %57 = select i1 %56, i1 true, i1 %54
  %58 = select i1 %56, i1 %51, i1 true
  %59 = select i1 %56, float %52, float %53
  br i1 %57, label %101, label %60

60:                                               ; preds = %50
  %61 = zext i32 %55 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !15
  %64 = mul nsw i32 %63, %1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %14, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !20
  %68 = fmul contract float %67, %18
  %69 = fmul float %68, 0x3FF7154760000000
  %70 = tail call float @llvm.rint.f32(float %69)
  %71 = fcmp ogt float %68, 0x40562E4300000000
  %72 = fcmp olt float %68, 0xC059D1DA00000000
  %73 = fneg float %69
  %74 = tail call float @llvm.fma.f32(float %68, float 0x3FF7154760000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %68, float 0x3E54AE0BE0000000, float %74)
  %76 = fsub float %69, %70
  %77 = fadd float %75, %76
  %78 = tail call float @llvm.exp2.f32(float %77)
  %79 = fptosi float %70 to i32
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %79)
  %81 = fsub contract float 1.000000e+00, %80
  %82 = select i1 %72, float 1.000000e+00, float %81
  %83 = select i1 %71, float 0xFFF0000000000000, float %82
  %84 = tail call i1 @llvm.amdgcn.class.f32(float %83, i32 144)
  %85 = select i1 %84, float 0x41F0000000000000, float 1.000000e+00
  %86 = fmul float %83, %85
  %87 = tail call float @llvm.log2.f32(float %86)
  %88 = fmul float %87, 0x3FE62E42E0000000
  %89 = tail call i1 @llvm.amdgcn.class.f32(float %87, i32 519)
  %90 = fneg float %88
  %91 = tail call float @llvm.fma.f32(float %87, float 0x3FE62E42E0000000, float %90)
  %92 = tail call float @llvm.fma.f32(float %87, float 0x3E6EFA39E0000000, float %91)
  %93 = fadd float %88, %92
  %94 = select i1 %89, float %87, float %93
  %95 = select i1 %84, float 0x40362E4300000000, float 0.000000e+00
  %96 = fsub float %94, %95
  %97 = tail call i1 @llvm.amdgcn.class.f32(float %96, i32 504)
  %98 = xor i1 %97, true
  %99 = select i1 %97, float %96, float -0.000000e+00
  %100 = fadd contract float %53, %99
  br label %101

101:                                              ; preds = %50, %60, %31
  %102 = phi i1 [ false, %31 ], [ %58, %50 ], [ %98, %60 ]
  %103 = phi float [ 0.000000e+00, %31 ], [ %59, %50 ], [ %100, %60 ]
  br i1 %102, label %216, label %201

104:                                              ; preds = %195, %48
  %105 = phi float [ 0.000000e+00, %48 ], [ %197, %195 ]
  %106 = phi i1 [ false, %48 ], [ %196, %195 ]
  %107 = phi i32 [ 0, %48 ], [ %198, %195 ]
  %108 = phi i32 [ 0, %48 ], [ %199, %195 ]
  br i1 %106, label %150, label %109

109:                                              ; preds = %104
  %110 = zext i32 %107 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !16, !amdgpu.noclobber !15
  %113 = mul nsw i32 %112, %1
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %14, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !20
  %117 = fmul contract float %116, %18
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = tail call float @llvm.rint.f32(float %118)
  %120 = fcmp ogt float %117, 0x40562E4300000000
  %121 = fcmp olt float %117, 0xC059D1DA00000000
  %122 = fneg float %118
  %123 = tail call float @llvm.fma.f32(float %117, float 0x3FF7154760000000, float %122)
  %124 = tail call float @llvm.fma.f32(float %117, float 0x3E54AE0BE0000000, float %123)
  %125 = fsub float %118, %119
  %126 = fadd float %124, %125
  %127 = tail call float @llvm.exp2.f32(float %126)
  %128 = fptosi float %119 to i32
  %129 = tail call float @llvm.amdgcn.ldexp.f32(float %127, i32 %128)
  %130 = fsub contract float 1.000000e+00, %129
  %131 = select i1 %121, float 1.000000e+00, float %130
  %132 = select i1 %120, float 0xFFF0000000000000, float %131
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %132, i32 144)
  %134 = select i1 %133, float 0x41F0000000000000, float 1.000000e+00
  %135 = fmul float %132, %134
  %136 = tail call float @llvm.log2.f32(float %135)
  %137 = fmul float %136, 0x3FE62E42E0000000
  %138 = tail call i1 @llvm.amdgcn.class.f32(float %136, i32 519)
  %139 = fneg float %137
  %140 = tail call float @llvm.fma.f32(float %136, float 0x3FE62E42E0000000, float %139)
  %141 = tail call float @llvm.fma.f32(float %136, float 0x3E6EFA39E0000000, float %140)
  %142 = fadd float %137, %141
  %143 = select i1 %138, float %136, float %142
  %144 = select i1 %133, float 0x40362E4300000000, float 0.000000e+00
  %145 = fsub float %143, %144
  %146 = tail call i1 @llvm.amdgcn.class.f32(float %145, i32 504)
  %147 = xor i1 %146, true
  %148 = select i1 %146, float %145, float -0.000000e+00
  %149 = fadd contract float %105, %148
  br label %150

150:                                              ; preds = %109, %104
  %151 = phi i1 [ true, %104 ], [ %147, %109 ]
  %152 = phi float [ %105, %104 ], [ %149, %109 ]
  br i1 %151, label %195, label %153

153:                                              ; preds = %150
  %154 = or i32 %107, 1
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !16, !amdgpu.noclobber !15
  %158 = mul nsw i32 %157, %1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %14, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !20
  %162 = fmul contract float %161, %18
  %163 = fmul float %162, 0x3FF7154760000000
  %164 = tail call float @llvm.rint.f32(float %163)
  %165 = fcmp ogt float %162, 0x40562E4300000000
  %166 = fcmp olt float %162, 0xC059D1DA00000000
  %167 = fneg float %163
  %168 = tail call float @llvm.fma.f32(float %162, float 0x3FF7154760000000, float %167)
  %169 = tail call float @llvm.fma.f32(float %162, float 0x3E54AE0BE0000000, float %168)
  %170 = fsub float %163, %164
  %171 = fadd float %169, %170
  %172 = tail call float @llvm.exp2.f32(float %171)
  %173 = fptosi float %164 to i32
  %174 = tail call float @llvm.amdgcn.ldexp.f32(float %172, i32 %173)
  %175 = fsub contract float 1.000000e+00, %174
  %176 = select i1 %166, float 1.000000e+00, float %175
  %177 = select i1 %165, float 0xFFF0000000000000, float %176
  %178 = tail call i1 @llvm.amdgcn.class.f32(float %177, i32 144)
  %179 = select i1 %178, float 0x41F0000000000000, float 1.000000e+00
  %180 = fmul float %177, %179
  %181 = tail call float @llvm.log2.f32(float %180)
  %182 = fmul float %181, 0x3FE62E42E0000000
  %183 = tail call i1 @llvm.amdgcn.class.f32(float %181, i32 519)
  %184 = fneg float %182
  %185 = tail call float @llvm.fma.f32(float %181, float 0x3FE62E42E0000000, float %184)
  %186 = tail call float @llvm.fma.f32(float %181, float 0x3E6EFA39E0000000, float %185)
  %187 = fadd float %182, %186
  %188 = select i1 %183, float %181, float %187
  %189 = select i1 %178, float 0x40362E4300000000, float 0.000000e+00
  %190 = fsub float %188, %189
  %191 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 504)
  %192 = xor i1 %191, true
  %193 = select i1 %191, float %190, float -0.000000e+00
  %194 = fadd contract float %152, %193
  br label %195

195:                                              ; preds = %153, %150
  %196 = phi i1 [ true, %150 ], [ %192, %153 ]
  %197 = phi float [ %152, %150 ], [ %194, %153 ]
  %198 = add nuw nsw i32 %107, 2
  %199 = add i32 %108, 2
  %200 = icmp eq i32 %199, %49
  br i1 %200, label %50, label %104, !llvm.loop !22

201:                                              ; preds = %101
  %202 = fmul float %103, 0x3FF7154760000000
  %203 = tail call float @llvm.rint.f32(float %202)
  %204 = fcmp ogt float %103, 0x40562E4300000000
  %205 = fcmp olt float %103, 0xC059D1DA00000000
  %206 = fneg float %202
  %207 = tail call float @llvm.fma.f32(float %103, float 0x3FF7154760000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %103, float 0x3E54AE0BE0000000, float %207)
  %209 = fsub float %202, %203
  %210 = fadd float %208, %209
  %211 = tail call float @llvm.exp2.f32(float %210)
  %212 = fptosi float %203 to i32
  %213 = tail call float @llvm.amdgcn.ldexp.f32(float %211, i32 %212)
  %214 = select i1 %205, float 0.000000e+00, float %213
  %215 = select i1 %204, float 0x7FF0000000000000, float %214
  br label %216

216:                                              ; preds = %201, %101
  %217 = phi float [ 0.000000e+00, %101 ], [ %215, %201 ]
  %218 = mul nsw i32 %32, %1
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %15, i64 %219
  store float %217, float addrspace(1)* %220, align 4, !tbaa !20
  %221 = add i32 %27, %32
  %222 = add i32 %221, %30
  %223 = icmp slt i32 %222, %5
  br i1 %223, label %31, label %224, !llvm.loop !24

224:                                              ; preds = %216, %11, %8
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
