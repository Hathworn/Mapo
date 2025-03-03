; ModuleID = '../data/hip_kernels/8685/16/main.cu'
source_filename = "../data/hip_kernels/8685/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11updateStatePdS_S_ifdiii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, float %4, double %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %17, %6
  %19 = add i32 %18, %16
  %20 = icmp sge i32 %19, %6
  %21 = add nsw i32 %6, %3
  %22 = icmp slt i32 %19, %21
  %23 = select i1 %20, i1 %22, i1 false
  br i1 %23, label %24, label %176

24:                                               ; preds = %9
  %25 = srem i32 %19, %3
  %26 = shl nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = add nuw nsw i32 %26, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %2, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7, !amdgpu.noclobber !5
  %34 = sext i32 %19 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = mul nsw i32 %25, %7
  %38 = add nsw i32 %37, %8
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fadd contract double %36, %41
  %43 = sub nsw i32 %19, %3
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = fneg contract double %29
  %48 = fsub contract double %42, %33
  %49 = fmul contract double %48, %47
  %50 = fptrunc double %49 to float
  %51 = fmul float %50, 0x3FF7154760000000
  %52 = tail call float @llvm.rint.f32(float %51)
  %53 = fcmp ogt float %50, 0x40562E4300000000
  %54 = fcmp olt float %50, 0xC059D1DA00000000
  %55 = fneg float %51
  %56 = tail call float @llvm.fma.f32(float %50, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %50, float 0x3E54AE0BE0000000, float %56)
  %58 = fsub float %51, %52
  %59 = fadd float %57, %58
  %60 = tail call float @llvm.exp2.f32(float %59)
  %61 = fptosi float %52 to i32
  %62 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 %61)
  %63 = fadd contract float %62, 1.000000e+00
  %64 = fdiv contract float 1.000000e+00, %63
  %65 = select i1 %54, float 1.000000e+00, float %64
  %66 = select i1 %53, float 0.000000e+00, float %65
  %67 = fpext float %66 to double
  %68 = fsub contract double %67, %46
  %69 = mul i32 %10, 1000
  %70 = add i32 %69, %17
  %71 = zext i32 %70 to i64
  %72 = tail call i64 @llvm.amdgcn.s.memtime()
  %73 = add nsw i64 %72, %71
  %74 = trunc i64 %73 to i32
  %75 = xor i32 %74, 746559103
  %76 = lshr i64 %73, 32
  %77 = trunc i64 %76 to i32
  %78 = xor i32 %77, -1607034933
  %79 = mul i32 %75, 1228688033
  %80 = mul i32 %78, 2073658381
  %81 = add i32 %79, 123456789
  %82 = xor i32 %79, 362436069
  %83 = add i32 %79, 5783321
  %84 = add i32 %79, 6615241
  %85 = add i32 %84, %80
  %86 = lshr i32 %81, 2
  %87 = xor i32 %86, %81
  %88 = shl i32 %83, 4
  %89 = shl i32 %87, 1
  %90 = xor i32 %88, %89
  %91 = xor i32 %90, %83
  %92 = xor i32 %91, %87
  %93 = add i32 %85, 362437
  %94 = add i32 %93, %92
  %95 = lshr i32 %82, 2
  %96 = xor i32 %95, %82
  %97 = shl i32 %92, 4
  %98 = shl i32 %96, 1
  %99 = xor i32 %98, %97
  %100 = xor i32 %99, %96
  %101 = xor i32 %100, %92
  %102 = add i32 %85, 724874
  %103 = add i32 %102, %101
  %104 = uitofp i32 %94 to float
  %105 = fmul contract float %104, 0x3DF0000000000000
  %106 = fadd contract float %105, 0x3DF0000000000000
  %107 = uitofp i32 %103 to float
  %108 = fmul contract float %107, 0x3E1921FB60000000
  %109 = fadd contract float %108, 0x3E1921FB60000000
  %110 = tail call i1 @llvm.amdgcn.class.f32(float %106, i32 144)
  %111 = select i1 %110, float 0x41F0000000000000, float 1.000000e+00
  %112 = fmul float %106, %111
  %113 = tail call float @llvm.log2.f32(float %112)
  %114 = fmul float %113, 0x3FE62E42E0000000
  %115 = tail call i1 @llvm.amdgcn.class.f32(float %113, i32 519)
  %116 = fneg float %114
  %117 = tail call float @llvm.fma.f32(float %113, float 0x3FE62E42E0000000, float %116)
  %118 = tail call float @llvm.fma.f32(float %113, float 0x3E6EFA39E0000000, float %117)
  %119 = fadd float %114, %118
  %120 = select i1 %115, float %113, float %119
  %121 = select i1 %110, float 0x40362E4300000000, float 0.000000e+00
  %122 = fsub float %120, %121
  %123 = fmul contract float %122, -2.000000e+00
  %124 = fcmp olt float %123, 0x39F0000000000000
  %125 = select i1 %124, float 0x41F0000000000000, float 1.000000e+00
  %126 = fmul float %123, %125
  %127 = tail call float @llvm.sqrt.f32(float %126)
  %128 = bitcast float %127 to i32
  %129 = add nsw i32 %128, -1
  %130 = bitcast i32 %129 to float
  %131 = add nsw i32 %128, 1
  %132 = bitcast i32 %131 to float
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %126, i32 608)
  %134 = select i1 %124, float 0x3EF0000000000000, float 1.000000e+00
  %135 = fneg float %132
  %136 = tail call float @llvm.fma.f32(float %135, float %127, float %126)
  %137 = fcmp ogt float %136, 0.000000e+00
  %138 = fneg float %130
  %139 = tail call float @llvm.fma.f32(float %138, float %127, float %126)
  %140 = fcmp ole float %139, 0.000000e+00
  %141 = select i1 %140, float %130, float %127
  %142 = select i1 %137, float %132, float %141
  %143 = fmul float %134, %142
  %144 = select i1 %133, float %126, float %143
  %145 = tail call float @llvm.sin.f32(float %109)
  %146 = fmul contract float %145, %144
  %147 = fpext float %146 to double
  %148 = fmul contract double %147, %5
  %149 = fcmp olt float %4, 0x39F0000000000000
  %150 = select i1 %149, float 0x41F0000000000000, float 1.000000e+00
  %151 = fmul float %150, %4
  %152 = tail call float @llvm.sqrt.f32(float %151)
  %153 = bitcast float %152 to i32
  %154 = add nsw i32 %153, -1
  %155 = bitcast i32 %154 to float
  %156 = add nsw i32 %153, 1
  %157 = bitcast i32 %156 to float
  %158 = tail call i1 @llvm.amdgcn.class.f32(float %151, i32 608)
  %159 = select i1 %149, float 0x3EF0000000000000, float 1.000000e+00
  %160 = fneg float %157
  %161 = tail call float @llvm.fma.f32(float %160, float %152, float %151)
  %162 = fcmp ogt float %161, 0.000000e+00
  %163 = fneg float %155
  %164 = tail call float @llvm.fma.f32(float %163, float %152, float %151)
  %165 = fcmp ole float %164, 0.000000e+00
  %166 = select i1 %165, float %155, float %152
  %167 = select i1 %162, float %157, float %166
  %168 = fmul float %159, %167
  %169 = select i1 %158, float %151, float %168
  %170 = fpext float %169 to double
  %171 = fmul contract double %148, %170
  %172 = fpext float %4 to double
  %173 = fmul contract double %68, %172
  %174 = fadd contract double %46, %173
  %175 = fadd contract double %174, %171
  store double %175, double addrspace(1)* %35, align 8, !tbaa !7
  br label %176

176:                                              ; preds = %24, %9
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
