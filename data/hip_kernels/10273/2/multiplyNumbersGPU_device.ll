; ModuleID = '../data/hip_kernels/10273/2/main.cu'
source_filename = "../data/hip_kernels/10273/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18multiplyNumbersGPUPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = shl i32 %4, 15
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 8
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = add i32 %9, %5
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = fmul contract float %13, %15
  %17 = fpext float %16 to double
  %18 = fdiv contract double %17, 0x4028B0FBA8826AA9
  %19 = fcmp olt double %18, 0x1000000000000000
  %20 = select i1 %19, double 0x4FF0000000000000, double 1.000000e+00
  %21 = fmul double %18, %20
  %22 = tail call double @llvm.amdgcn.rsq.f64(double %21)
  %23 = fmul double %21, %22
  %24 = fmul double %22, 5.000000e-01
  %25 = fneg double %24
  %26 = tail call double @llvm.fma.f64(double %25, double %23, double 5.000000e-01)
  %27 = tail call double @llvm.fma.f64(double %24, double %26, double %24)
  %28 = tail call double @llvm.fma.f64(double %23, double %26, double %23)
  %29 = fneg double %28
  %30 = tail call double @llvm.fma.f64(double %29, double %28, double %21)
  %31 = tail call double @llvm.fma.f64(double %30, double %27, double %28)
  %32 = tail call float @llvm.fabs.f32(float %13)
  %33 = fcmp olt float %32, 1.310720e+05
  br i1 %33, label %34, label %42

34:                                               ; preds = %3
  %35 = fmul float %32, 0x3FE45F3060000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = tail call float @llvm.fma.f32(float %36, float 0xBFF921FB40000000, float %32)
  %38 = tail call float @llvm.fma.f32(float %36, float 0xBE74442D00000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %36, float 0xBCF8469880000000, float %38)
  %40 = fptosi float %36 to i32
  %41 = bitcast float %32 to i32
  br label %148

42:                                               ; preds = %3
  %43 = bitcast float %32 to i32
  %44 = lshr i32 %43, 23
  %45 = and i32 %43, 8388607
  %46 = or i32 %45, 8388608
  %47 = zext i32 %46 to i64
  %48 = mul nuw nsw i64 %47, 4266746795
  %49 = trunc i64 %48 to i32
  %50 = lshr i64 %48, 32
  %51 = mul nuw nsw i64 %47, 1011060801
  %52 = add nuw nsw i64 %50, %51
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %47, 3680671129
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %47, 4113882560
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %47, 4230436817
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %47, 1313084713
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %47, 2734261102
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = trunc i64 %74 to i32
  %76 = add nsw i32 %44, -120
  %77 = icmp ugt i32 %76, 63
  %78 = select i1 %77, i32 %69, i32 %75
  %79 = select i1 %77, i32 %65, i32 %73
  %80 = select i1 %77, i32 %61, i32 %69
  %81 = select i1 %77, i32 %57, i32 %65
  %82 = select i1 %77, i32 %53, i32 %61
  %83 = select i1 %77, i32 %49, i32 %57
  %84 = select i1 %77, i32 -64, i32 0
  %85 = add nsw i32 %84, %76
  %86 = icmp ugt i32 %85, 31
  %87 = select i1 %86, i32 %79, i32 %78
  %88 = select i1 %86, i32 %80, i32 %79
  %89 = select i1 %86, i32 %81, i32 %80
  %90 = select i1 %86, i32 %82, i32 %81
  %91 = select i1 %86, i32 %83, i32 %82
  %92 = select i1 %86, i32 -32, i32 0
  %93 = add nsw i32 %92, %85
  %94 = icmp ugt i32 %93, 31
  %95 = select i1 %94, i32 %88, i32 %87
  %96 = select i1 %94, i32 %89, i32 %88
  %97 = select i1 %94, i32 %90, i32 %89
  %98 = select i1 %94, i32 %91, i32 %90
  %99 = select i1 %94, i32 -32, i32 0
  %100 = add nsw i32 %99, %93
  %101 = icmp eq i32 %100, 0
  %102 = sub nsw i32 32, %100
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %102)
  %104 = tail call i32 @llvm.fshr.i32(i32 %96, i32 %97, i32 %102)
  %105 = tail call i32 @llvm.fshr.i32(i32 %97, i32 %98, i32 %102)
  %106 = select i1 %101, i32 %95, i32 %103
  %107 = select i1 %101, i32 %96, i32 %104
  %108 = select i1 %101, i32 %97, i32 %105
  %109 = lshr i32 %106, 29
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 2)
  %111 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %108, i32 2)
  %112 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %98, i32 2)
  %113 = and i32 %109, 1
  %114 = sub nsw i32 0, %113
  %115 = shl i32 %109, 31
  %116 = xor i32 %110, %114
  %117 = xor i32 %111, %114
  %118 = xor i32 %112, %114
  %119 = tail call i32 @llvm.ctlz.i32(i32 %116, i1 false), !range !10
  %120 = sub nsw i32 31, %119
  %121 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %117, i32 %120)
  %122 = tail call i32 @llvm.fshr.i32(i32 %117, i32 %118, i32 %120)
  %123 = shl nuw nsw i32 %119, 23
  %124 = sub nuw nsw i32 1056964608, %123
  %125 = lshr i32 %121, 9
  %126 = or i32 %125, %124
  %127 = or i32 %126, %115
  %128 = bitcast i32 %127 to float
  %129 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %122, i32 23)
  %130 = tail call i32 @llvm.ctlz.i32(i32 %129, i1 false), !range !10
  %131 = fmul float %128, 0x3FF921FB40000000
  %132 = add nuw nsw i32 %130, %119
  %133 = shl nuw nsw i32 %132, 23
  %134 = sub nuw nsw i32 855638016, %133
  %135 = sub nsw i32 31, %130
  %136 = tail call i32 @llvm.fshr.i32(i32 %129, i32 %122, i32 %135)
  %137 = lshr i32 %136, 9
  %138 = or i32 %134, %137
  %139 = or i32 %138, %115
  %140 = bitcast i32 %139 to float
  %141 = fneg float %131
  %142 = tail call float @llvm.fma.f32(float %128, float 0x3FF921FB40000000, float %141)
  %143 = tail call float @llvm.fma.f32(float %128, float 0x3E74442D00000000, float %142)
  %144 = tail call float @llvm.fma.f32(float %140, float 0x3FF921FB40000000, float %143)
  %145 = fadd float %131, %144
  %146 = lshr i32 %106, 30
  %147 = add nuw nsw i32 %113, %146
  br label %148

148:                                              ; preds = %34, %42
  %149 = phi i32 [ %41, %34 ], [ %43, %42 ]
  %150 = phi float [ %39, %34 ], [ %145, %42 ]
  %151 = phi i32 [ %40, %34 ], [ %147, %42 ]
  %152 = fcmp oeq double %21, 0.000000e+00
  %153 = fcmp oeq double %21, 0x7FF0000000000000
  %154 = or i1 %152, %153
  %155 = select i1 %19, double 0x37F0000000000000, double 1.000000e+00
  %156 = fneg double %31
  %157 = tail call double @llvm.fma.f64(double %156, double %31, double %21)
  %158 = tail call double @llvm.fma.f64(double %157, double %27, double %31)
  %159 = fmul double %155, %158
  %160 = select i1 %154, double %21, double %159
  %161 = fmul float %150, %150
  %162 = tail call float @llvm.fmuladd.f32(float %161, float 0xBF29833040000000, float 0x3F81103880000000)
  %163 = tail call float @llvm.fmuladd.f32(float %161, float %162, float 0xBFC55553A0000000)
  %164 = fmul float %161, %163
  %165 = tail call float @llvm.fmuladd.f32(float %150, float %164, float %150)
  %166 = tail call float @llvm.fmuladd.f32(float %161, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %167 = tail call float @llvm.fmuladd.f32(float %161, float %166, float 0x3FA5557EE0000000)
  %168 = tail call float @llvm.fmuladd.f32(float %161, float %167, float 0xBFE0000080000000)
  %169 = tail call float @llvm.fmuladd.f32(float %161, float %168, float 1.000000e+00)
  %170 = and i32 %151, 1
  %171 = icmp eq i32 %170, 0
  %172 = select i1 %171, float %165, float %169
  %173 = bitcast float %172 to i32
  %174 = shl i32 %151, 30
  %175 = and i32 %174, -2147483648
  %176 = bitcast float %13 to i32
  %177 = xor i32 %149, %176
  %178 = xor i32 %177, %175
  %179 = xor i32 %178, %173
  %180 = bitcast i32 %179 to float
  %181 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 504)
  %182 = fpext float %180 to double
  %183 = select i1 %181, double %182, double 0x7FF8000000000000
  %184 = fmul contract double %160, %183
  %185 = fptrunc double %184 to float
  %186 = getelementptr inbounds float, float addrspace(1)* %2, i64 %11
  store float %185, float addrspace(1)* %186, align 4, !tbaa !5
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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i32 0, i32 33}
