; ModuleID = '../data/hip_kernels/17643/1/main.cu'
source_filename = "../data/hip_kernels/17643/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_anchors = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10yoloKerneliPKfPfPKiiiiiff(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %232

21:                                               ; preds = %10
  %22 = shl nsw i32 %4, 1
  %23 = icmp ult i32 %18, %22
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = zext i32 %18 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_anchors, i32 0, i32 %18
  store i32 %27, i32 addrspace(3)* %28, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %24, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = freeze i32 %19
  %31 = freeze i32 %7
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = freeze i32 %6
  %36 = sdiv i32 %32, %35
  %37 = mul i32 %36, %35
  %38 = sub i32 %32, %37
  %39 = freeze i32 %4
  %40 = sdiv i32 %36, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %36, %41
  %43 = add nsw i32 %5, 5
  %44 = mul nsw i32 %7, %6
  %45 = mul i32 %40, %4
  %46 = add i32 %45, %42
  %47 = mul i32 %43, %6
  %48 = mul i32 %47, %46
  %49 = add nsw i32 %48, %38
  %50 = mul nsw i32 %49, %7
  %51 = add nsw i32 %50, %34
  %52 = shl nsw i32 %44, 2
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11, !amdgpu.noclobber !5
  %57 = fneg contract float %56
  %58 = fmul float %56, 0xBFF7154760000000
  %59 = tail call float @llvm.rint.f32(float %58)
  %60 = fcmp olt float %56, 0xC0562E4300000000
  %61 = fcmp ogt float %56, 0x4059D1DA00000000
  %62 = fneg float %58
  %63 = tail call float @llvm.fma.f32(float %57, float 0x3FF7154760000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %57, float 0x3E54AE0BE0000000, float %63)
  %65 = fsub float %58, %59
  %66 = fadd float %64, %65
  %67 = tail call float @llvm.exp2.f32(float %66)
  %68 = fptosi float %59 to i32
  %69 = tail call float @llvm.amdgcn.ldexp.f32(float %67, i32 %68)
  %70 = select i1 %61, float 0.000000e+00, float %69
  %71 = select i1 %60, float 0x7FF0000000000000, float %70
  %72 = fpext float %71 to double
  %73 = fadd contract double %72, 1.000000e+00
  %74 = fdiv contract double 1.000000e+00, %73
  %75 = fptrunc double %74 to float
  %76 = fcmp contract ogt float %75, %9
  br i1 %76, label %77, label %232

77:                                               ; preds = %29
  %78 = icmp sgt i32 %5, 0
  br i1 %78, label %83, label %79

79:                                               ; preds = %83, %77
  %80 = phi float [ %9, %77 ], [ %114, %83 ]
  %81 = phi i32 [ -1, %77 ], [ %115, %83 ]
  %82 = icmp sgt i32 %81, -1
  br i1 %82, label %118, label %232

83:                                               ; preds = %77, %83
  %84 = phi i32 [ %115, %83 ], [ -1, %77 ]
  %85 = phi float [ %114, %83 ], [ %9, %77 ]
  %86 = phi i32 [ %116, %83 ], [ 0, %77 ]
  %87 = add nuw nsw i32 %86, 5
  %88 = mul nsw i32 %87, %44
  %89 = add nsw i32 %88, %51
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11, !amdgpu.noclobber !5
  %93 = fneg contract float %92
  %94 = fmul float %92, 0xBFF7154760000000
  %95 = tail call float @llvm.rint.f32(float %94)
  %96 = fcmp olt float %92, 0xC0562E4300000000
  %97 = fcmp ogt float %92, 0x4059D1DA00000000
  %98 = fneg float %94
  %99 = tail call float @llvm.fma.f32(float %93, float 0x3FF7154760000000, float %98)
  %100 = tail call float @llvm.fma.f32(float %93, float 0x3E54AE0BE0000000, float %99)
  %101 = fsub float %94, %95
  %102 = fadd float %100, %101
  %103 = tail call float @llvm.exp2.f32(float %102)
  %104 = fptosi float %95 to i32
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %103, i32 %104)
  %106 = select i1 %97, float 0.000000e+00, float %105
  %107 = select i1 %96, float 0x7FF0000000000000, float %106
  %108 = fpext float %107 to double
  %109 = fadd contract double %108, 1.000000e+00
  %110 = fdiv contract double 1.000000e+00, %109
  %111 = fptrunc double %110 to float
  %112 = fmul contract float %75, %111
  %113 = fcmp contract ogt float %112, %85
  %114 = select i1 %113, float %112, float %85
  %115 = select i1 %113, i32 %86, i32 %84
  %116 = add nuw nsw i32 %86, 1
  %117 = icmp eq i32 %116, %5
  br i1 %117, label %79, label %83, !llvm.loop !13

118:                                              ; preds = %79
  %119 = atomicrmw fadd float addrspace(1)* %2, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  %120 = fptosi float %119 to i32
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %122 = mul nsw i32 %120, 7
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %121, i64 %123
  %125 = sitofp i32 %34 to float
  %126 = sext i32 %51 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !11
  %129 = fneg contract float %128
  %130 = fmul float %128, 0xBFF7154760000000
  %131 = tail call float @llvm.rint.f32(float %130)
  %132 = fcmp olt float %128, 0xC0562E4300000000
  %133 = fcmp ogt float %128, 0x4059D1DA00000000
  %134 = fneg float %130
  %135 = tail call float @llvm.fma.f32(float %129, float 0x3FF7154760000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %129, float 0x3E54AE0BE0000000, float %135)
  %137 = fsub float %130, %131
  %138 = fadd float %136, %137
  %139 = tail call float @llvm.exp2.f32(float %138)
  %140 = fptosi float %131 to i32
  %141 = tail call float @llvm.amdgcn.ldexp.f32(float %139, i32 %140)
  %142 = select i1 %133, float 0.000000e+00, float %141
  %143 = select i1 %132, float 0x7FF0000000000000, float %142
  %144 = fpext float %143 to double
  %145 = fadd contract double %144, 1.000000e+00
  %146 = fdiv contract double 1.000000e+00, %145
  %147 = fptrunc double %146 to float
  %148 = fadd contract float %125, %147
  %149 = fmul contract float %148, %8
  store float %149, float addrspace(1)* %124, align 4, !tbaa !11
  %150 = sitofp i32 %38 to float
  %151 = add nsw i32 %51, %44
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !11
  %155 = fneg contract float %154
  %156 = fmul float %154, 0xBFF7154760000000
  %157 = tail call float @llvm.rint.f32(float %156)
  %158 = fcmp olt float %154, 0xC0562E4300000000
  %159 = fcmp ogt float %154, 0x4059D1DA00000000
  %160 = fneg float %156
  %161 = tail call float @llvm.fma.f32(float %155, float 0x3FF7154760000000, float %160)
  %162 = tail call float @llvm.fma.f32(float %155, float 0x3E54AE0BE0000000, float %161)
  %163 = fsub float %156, %157
  %164 = fadd float %162, %163
  %165 = tail call float @llvm.exp2.f32(float %164)
  %166 = fptosi float %157 to i32
  %167 = tail call float @llvm.amdgcn.ldexp.f32(float %165, i32 %166)
  %168 = select i1 %159, float 0.000000e+00, float %167
  %169 = select i1 %158, float 0x7FF0000000000000, float %168
  %170 = fpext float %169 to double
  %171 = fadd contract double %170, 1.000000e+00
  %172 = fdiv contract double 1.000000e+00, %171
  %173 = fptrunc double %172 to float
  %174 = fadd contract float %150, %173
  %175 = fmul contract float %174, %8
  %176 = getelementptr inbounds float, float addrspace(1)* %124, i64 1
  store float %175, float addrspace(1)* %176, align 4, !tbaa !11
  %177 = shl nsw i32 %44, 1
  %178 = add nsw i32 %51, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !11
  %182 = fmul float %181, 0x3FF7154760000000
  %183 = tail call float @llvm.rint.f32(float %182)
  %184 = fcmp ogt float %181, 0x40562E4300000000
  %185 = fcmp olt float %181, 0xC059D1DA00000000
  %186 = fneg float %182
  %187 = tail call float @llvm.fma.f32(float %181, float 0x3FF7154760000000, float %186)
  %188 = tail call float @llvm.fma.f32(float %181, float 0x3E54AE0BE0000000, float %187)
  %189 = fsub float %182, %183
  %190 = fadd float %188, %189
  %191 = tail call float @llvm.exp2.f32(float %190)
  %192 = fptosi float %183 to i32
  %193 = tail call float @llvm.amdgcn.ldexp.f32(float %191, i32 %192)
  %194 = select i1 %185, float 0.000000e+00, float %193
  %195 = select i1 %184, float 0x7FF0000000000000, float %194
  %196 = shl nsw i32 %42, 1
  %197 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_anchors, i32 0, i32 %196
  %198 = load i32, i32 addrspace(3)* %197, align 4, !tbaa !7
  %199 = sitofp i32 %198 to float
  %200 = fmul contract float %195, %199
  %201 = getelementptr inbounds float, float addrspace(1)* %124, i64 2
  store float %200, float addrspace(1)* %201, align 4, !tbaa !11
  %202 = mul nsw i32 %44, 3
  %203 = add nsw i32 %51, %202
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !11
  %207 = fmul float %206, 0x3FF7154760000000
  %208 = tail call float @llvm.rint.f32(float %207)
  %209 = fcmp ogt float %206, 0x40562E4300000000
  %210 = fcmp olt float %206, 0xC059D1DA00000000
  %211 = fneg float %207
  %212 = tail call float @llvm.fma.f32(float %206, float 0x3FF7154760000000, float %211)
  %213 = tail call float @llvm.fma.f32(float %206, float 0x3E54AE0BE0000000, float %212)
  %214 = fsub float %207, %208
  %215 = fadd float %213, %214
  %216 = tail call float @llvm.exp2.f32(float %215)
  %217 = fptosi float %208 to i32
  %218 = tail call float @llvm.amdgcn.ldexp.f32(float %216, i32 %217)
  %219 = select i1 %210, float 0.000000e+00, float %218
  %220 = select i1 %209, float 0x7FF0000000000000, float %219
  %221 = add nuw nsw i32 %196, 1
  %222 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared_anchors, i32 0, i32 %221
  %223 = load i32, i32 addrspace(3)* %222, align 4, !tbaa !7
  %224 = sitofp i32 %223 to float
  %225 = fmul contract float %220, %224
  %226 = getelementptr inbounds float, float addrspace(1)* %124, i64 3
  store float %225, float addrspace(1)* %226, align 4, !tbaa !11
  %227 = sitofp i32 %81 to float
  %228 = getelementptr inbounds float, float addrspace(1)* %124, i64 4
  store float %227, float addrspace(1)* %228, align 4, !tbaa !11
  %229 = getelementptr inbounds float, float addrspace(1)* %124, i64 5
  store float %80, float addrspace(1)* %229, align 4, !tbaa !11
  %230 = sitofp i32 %40 to float
  %231 = getelementptr inbounds float, float addrspace(1)* %124, i64 6
  store float %230, float addrspace(1)* %231, align 4, !tbaa !11
  br label %232

232:                                              ; preds = %29, %118, %79, %10
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
