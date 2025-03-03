; ModuleID = '../data/hip_kernels/1180/12/main.cu'
source_filename = "../data/hip_kernels/1180/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24patchmatch_r_conv_kernelPfS_S_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = mul nsw i32 %7, %6
  %21 = mul nsw i32 %9, %8
  %22 = mul nsw i32 %21, %20
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %222

24:                                               ; preds = %10
  %25 = freeze i32 %19
  %26 = freeze i32 %21
  %27 = sdiv i32 %25, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %25, %28
  %30 = freeze i32 %7
  %31 = sdiv i32 %27, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %27, %32
  %34 = freeze i32 %9
  %35 = sdiv i32 %29, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %29, %36
  %38 = add nsw i32 %3, -1
  %39 = sdiv i32 %38, 2
  %40 = sub nsw i32 0, %39
  %41 = icmp slt i32 %3, 0
  br i1 %41, label %61, label %42

42:                                               ; preds = %24
  %43 = icmp sgt i32 %5, 0
  %44 = and i32 %5, 1
  %45 = icmp eq i32 %5, 1
  %46 = and i32 %5, -2
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %42, %115
  %49 = phi double [ 0.000000e+00, %42 ], [ %219, %115 ]
  %50 = phi double [ 0.000000e+00, %42 ], [ %218, %115 ]
  %51 = phi double [ 0.000000e+00, %42 ], [ %217, %115 ]
  %52 = phi i32 [ %40, %42 ], [ %116, %115 ]
  %53 = add nsw i32 %52, %31
  %54 = add nsw i32 %52, %35
  %55 = icmp sgt i32 %53, -1
  %56 = icmp slt i32 %53, %6
  %57 = icmp sgt i32 %54, -1
  %58 = icmp slt i32 %54, %8
  %59 = mul nsw i32 %53, %7
  %60 = mul nsw i32 %54, %9
  br label %118

61:                                               ; preds = %115, %24
  %62 = phi double [ 0.000000e+00, %24 ], [ %217, %115 ]
  %63 = phi double [ 0.000000e+00, %24 ], [ %218, %115 ]
  %64 = phi double [ 0.000000e+00, %24 ], [ %219, %115 ]
  %65 = fcmp olt double %63, 0x1000000000000000
  %66 = select i1 %65, double 0x4FF0000000000000, double 1.000000e+00
  %67 = fmul double %63, %66
  %68 = tail call double @llvm.amdgcn.rsq.f64(double %67)
  %69 = fmul double %67, %68
  %70 = fmul double %68, 5.000000e-01
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %71, double %69, double 5.000000e-01)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double %70)
  %74 = tail call double @llvm.fma.f64(double %69, double %72, double %69)
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %75, double %74, double %67)
  %77 = tail call double @llvm.fma.f64(double %76, double %73, double %74)
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %78, double %77, double %67)
  %80 = tail call double @llvm.fma.f64(double %79, double %73, double %77)
  %81 = select i1 %65, double 0x37F0000000000000, double 1.000000e+00
  %82 = fmul double %81, %80
  %83 = fcmp oeq double %67, 0.000000e+00
  %84 = fcmp oeq double %67, 0x7FF0000000000000
  %85 = or i1 %83, %84
  %86 = select i1 %85, double %67, double %82
  %87 = fcmp olt double %62, 0x1000000000000000
  %88 = select i1 %87, double 0x4FF0000000000000, double 1.000000e+00
  %89 = fmul double %62, %88
  %90 = tail call double @llvm.amdgcn.rsq.f64(double %89)
  %91 = fmul double %89, %90
  %92 = fmul double %90, 5.000000e-01
  %93 = fneg double %92
  %94 = tail call double @llvm.fma.f64(double %93, double %91, double 5.000000e-01)
  %95 = tail call double @llvm.fma.f64(double %92, double %94, double %92)
  %96 = tail call double @llvm.fma.f64(double %91, double %94, double %91)
  %97 = fneg double %96
  %98 = tail call double @llvm.fma.f64(double %97, double %96, double %89)
  %99 = tail call double @llvm.fma.f64(double %98, double %95, double %96)
  %100 = fneg double %99
  %101 = tail call double @llvm.fma.f64(double %100, double %99, double %89)
  %102 = tail call double @llvm.fma.f64(double %101, double %95, double %99)
  %103 = select i1 %87, double 0x37F0000000000000, double 1.000000e+00
  %104 = fmul double %103, %102
  %105 = fcmp oeq double %89, 0.000000e+00
  %106 = fcmp oeq double %89, 0x7FF0000000000000
  %107 = or i1 %105, %106
  %108 = select i1 %107, double %89, double %104
  %109 = fmul contract double %108, %86
  %110 = fadd contract double %109, 1.000000e-09
  %111 = fdiv contract double %64, %110
  %112 = fptrunc double %111 to float
  %113 = sext i32 %19 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  store float %112, float addrspace(1)* %114, align 4, !tbaa !7
  br label %222

115:                                              ; preds = %216
  %116 = add nsw i32 %52, %4
  %117 = icmp sgt i32 %116, %39
  br i1 %117, label %61, label %48, !llvm.loop !11

118:                                              ; preds = %48, %216
  %119 = phi double [ %49, %48 ], [ %219, %216 ]
  %120 = phi double [ %50, %48 ], [ %218, %216 ]
  %121 = phi double [ %51, %48 ], [ %217, %216 ]
  %122 = phi i32 [ %40, %48 ], [ %220, %216 ]
  %123 = add nsw i32 %122, %33
  %124 = add nsw i32 %122, %37
  %125 = icmp sgt i32 %123, -1
  %126 = icmp slt i32 %123, %7
  %127 = select i1 %125, i1 %126, i1 false
  %128 = select i1 %127, i1 %55, i1 false
  %129 = icmp sgt i32 %124, -1
  %130 = select i1 %128, i1 %56, i1 false
  %131 = select i1 %130, i1 %129, i1 false
  br i1 %131, label %132, label %216

132:                                              ; preds = %118
  %133 = icmp slt i32 %124, %9
  %134 = select i1 %133, i1 %57, i1 false
  %135 = select i1 %134, i1 %58, i1 false
  br i1 %135, label %136, label %216

136:                                              ; preds = %132
  %137 = add nsw i32 %123, %59
  %138 = add nsw i32 %124, %60
  br i1 %43, label %139, label %216

139:                                              ; preds = %136
  br i1 %45, label %188, label %140

140:                                              ; preds = %139, %140
  %141 = phi double [ %178, %140 ], [ %119, %139 ]
  %142 = phi double [ %181, %140 ], [ %120, %139 ]
  %143 = phi i32 [ %185, %140 ], [ 0, %139 ]
  %144 = phi double [ %184, %140 ], [ %121, %139 ]
  %145 = phi i32 [ %186, %140 ], [ 0, %139 ]
  %146 = mul nsw i32 %143, %20
  %147 = add nsw i32 %137, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = mul nsw i32 %143, %21
  %152 = add nsw i32 %138, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = fmul contract float %150, %155
  %157 = fpext float %156 to double
  %158 = fadd contract double %141, %157
  %159 = fmul contract float %150, %150
  %160 = fpext float %159 to double
  %161 = fadd contract double %142, %160
  %162 = fmul contract float %155, %155
  %163 = fpext float %162 to double
  %164 = fadd contract double %144, %163
  %165 = or i32 %143, 1
  %166 = mul nsw i32 %165, %20
  %167 = add nsw i32 %137, %166
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %171 = mul nsw i32 %165, %21
  %172 = add nsw i32 %138, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !5
  %176 = fmul contract float %170, %175
  %177 = fpext float %176 to double
  %178 = fadd contract double %158, %177
  %179 = fmul contract float %170, %170
  %180 = fpext float %179 to double
  %181 = fadd contract double %161, %180
  %182 = fmul contract float %175, %175
  %183 = fpext float %182 to double
  %184 = fadd contract double %164, %183
  %185 = add nuw nsw i32 %143, 2
  %186 = add i32 %145, 2
  %187 = icmp eq i32 %186, %46
  br i1 %187, label %188, label %140, !llvm.loop !13

188:                                              ; preds = %140, %139
  %189 = phi double [ undef, %139 ], [ %178, %140 ]
  %190 = phi double [ undef, %139 ], [ %181, %140 ]
  %191 = phi double [ undef, %139 ], [ %184, %140 ]
  %192 = phi double [ %119, %139 ], [ %178, %140 ]
  %193 = phi double [ %120, %139 ], [ %181, %140 ]
  %194 = phi i32 [ 0, %139 ], [ %185, %140 ]
  %195 = phi double [ %121, %139 ], [ %184, %140 ]
  br i1 %47, label %216, label %196

196:                                              ; preds = %188
  %197 = mul nsw i32 %194, %20
  %198 = add nsw i32 %137, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7, !amdgpu.noclobber !5
  %202 = mul nsw i32 %194, %21
  %203 = add nsw i32 %138, %202
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !5
  %207 = fmul contract float %201, %206
  %208 = fpext float %207 to double
  %209 = fadd contract double %192, %208
  %210 = fmul contract float %201, %201
  %211 = fpext float %210 to double
  %212 = fadd contract double %193, %211
  %213 = fmul contract float %206, %206
  %214 = fpext float %213 to double
  %215 = fadd contract double %195, %214
  br label %216

216:                                              ; preds = %196, %188, %136, %132, %118
  %217 = phi double [ %121, %132 ], [ %121, %118 ], [ %121, %136 ], [ %191, %188 ], [ %215, %196 ]
  %218 = phi double [ %120, %132 ], [ %120, %118 ], [ %120, %136 ], [ %190, %188 ], [ %212, %196 ]
  %219 = phi double [ %119, %132 ], [ %119, %118 ], [ %119, %136 ], [ %189, %188 ], [ %209, %196 ]
  %220 = add nsw i32 %122, %4
  %221 = icmp sgt i32 %220, %39
  br i1 %221, label %115, label %118, !llvm.loop !14

222:                                              ; preds = %61, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
