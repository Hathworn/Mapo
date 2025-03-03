; ModuleID = '../data/hip_kernels/8685/14/main.cu'
source_filename = "../data/hip_kernels/8685/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11updateStatePfS_iffiiiff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, float %3, float %4, i32 %5, i32 %6, i32 %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %18, %5
  %20 = add i32 %19, %17
  %21 = icmp sge i32 %20, %5
  %22 = add nsw i32 %5, %2
  %23 = icmp slt i32 %20, %22
  %24 = select i1 %21, i1 %23, i1 false
  br i1 %24, label %25, label %164

25:                                               ; preds = %10
  %26 = srem i32 %20, %2
  %27 = sext i32 %20 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = mul nsw i32 %26, %6
  %31 = add nsw i32 %30, %7
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fadd contract float %29, %34
  %36 = sub nsw i32 %20, %2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fneg contract float %8
  %41 = fsub contract float %35, %9
  %42 = fmul contract float %41, %40
  %43 = fmul float %42, 0x3FF7154760000000
  %44 = tail call float @llvm.rint.f32(float %43)
  %45 = fcmp ogt float %42, 0x40562E4300000000
  %46 = fcmp olt float %42, 0xC059D1DA00000000
  %47 = fneg float %43
  %48 = tail call float @llvm.fma.f32(float %42, float 0x3FF7154760000000, float %47)
  %49 = tail call float @llvm.fma.f32(float %42, float 0x3E54AE0BE0000000, float %48)
  %50 = fsub float %43, %44
  %51 = fadd float %49, %50
  %52 = tail call float @llvm.exp2.f32(float %51)
  %53 = fptosi float %44 to i32
  %54 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 %53)
  %55 = fadd contract float %54, 1.000000e+00
  %56 = fdiv contract float 1.000000e+00, %55
  %57 = select i1 %46, float 1.000000e+00, float %56
  %58 = select i1 %45, float 0.000000e+00, float %57
  %59 = fsub contract float %58, %39
  %60 = mul i32 %11, 1000
  %61 = add i32 %60, %18
  %62 = zext i32 %61 to i64
  %63 = tail call i64 @llvm.amdgcn.s.memtime()
  %64 = add nsw i64 %63, %62
  %65 = trunc i64 %64 to i32
  %66 = xor i32 %65, 746559103
  %67 = lshr i64 %64, 32
  %68 = trunc i64 %67 to i32
  %69 = xor i32 %68, -1607034933
  %70 = mul i32 %66, 1228688033
  %71 = mul i32 %69, 2073658381
  %72 = add i32 %70, 123456789
  %73 = xor i32 %70, 362436069
  %74 = add i32 %70, 5783321
  %75 = add i32 %70, 6615241
  %76 = add i32 %75, %71
  %77 = lshr i32 %72, 2
  %78 = xor i32 %77, %72
  %79 = shl i32 %74, 4
  %80 = shl i32 %78, 1
  %81 = xor i32 %79, %80
  %82 = xor i32 %81, %74
  %83 = xor i32 %82, %78
  %84 = add i32 %76, 362437
  %85 = add i32 %84, %83
  %86 = lshr i32 %73, 2
  %87 = xor i32 %86, %73
  %88 = shl i32 %83, 4
  %89 = shl i32 %87, 1
  %90 = xor i32 %89, %88
  %91 = xor i32 %90, %87
  %92 = xor i32 %91, %83
  %93 = add i32 %76, 724874
  %94 = add i32 %93, %92
  %95 = uitofp i32 %85 to float
  %96 = fmul contract float %95, 0x3DF0000000000000
  %97 = fadd contract float %96, 0x3DF0000000000000
  %98 = uitofp i32 %94 to float
  %99 = fmul contract float %98, 0x3E1921FB60000000
  %100 = fadd contract float %99, 0x3E1921FB60000000
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %97, i32 144)
  %102 = select i1 %101, float 0x41F0000000000000, float 1.000000e+00
  %103 = fmul float %97, %102
  %104 = tail call float @llvm.log2.f32(float %103)
  %105 = fmul float %104, 0x3FE62E42E0000000
  %106 = tail call i1 @llvm.amdgcn.class.f32(float %104, i32 519)
  %107 = fneg float %105
  %108 = tail call float @llvm.fma.f32(float %104, float 0x3FE62E42E0000000, float %107)
  %109 = tail call float @llvm.fma.f32(float %104, float 0x3E6EFA39E0000000, float %108)
  %110 = fadd float %105, %109
  %111 = select i1 %106, float %104, float %110
  %112 = select i1 %101, float 0x40362E4300000000, float 0.000000e+00
  %113 = fsub float %111, %112
  %114 = fmul contract float %113, -2.000000e+00
  %115 = fcmp olt float %114, 0x39F0000000000000
  %116 = select i1 %115, float 0x41F0000000000000, float 1.000000e+00
  %117 = fmul float %114, %116
  %118 = tail call float @llvm.sqrt.f32(float %117)
  %119 = bitcast float %118 to i32
  %120 = add nsw i32 %119, -1
  %121 = bitcast i32 %120 to float
  %122 = add nsw i32 %119, 1
  %123 = bitcast i32 %122 to float
  %124 = tail call i1 @llvm.amdgcn.class.f32(float %117, i32 608)
  %125 = select i1 %115, float 0x3EF0000000000000, float 1.000000e+00
  %126 = fneg float %123
  %127 = tail call float @llvm.fma.f32(float %126, float %118, float %117)
  %128 = fcmp ogt float %127, 0.000000e+00
  %129 = fneg float %121
  %130 = tail call float @llvm.fma.f32(float %129, float %118, float %117)
  %131 = fcmp ole float %130, 0.000000e+00
  %132 = select i1 %131, float %121, float %118
  %133 = select i1 %128, float %123, float %132
  %134 = fmul float %125, %133
  %135 = select i1 %124, float %117, float %134
  %136 = tail call float @llvm.sin.f32(float %100)
  %137 = fmul contract float %136, %135
  %138 = fmul contract float %137, %4
  %139 = fcmp olt float %3, 0x39F0000000000000
  %140 = select i1 %139, float 0x41F0000000000000, float 1.000000e+00
  %141 = fmul float %140, %3
  %142 = tail call float @llvm.sqrt.f32(float %141)
  %143 = bitcast float %142 to i32
  %144 = add nsw i32 %143, -1
  %145 = bitcast i32 %144 to float
  %146 = add nsw i32 %143, 1
  %147 = bitcast i32 %146 to float
  %148 = tail call i1 @llvm.amdgcn.class.f32(float %141, i32 608)
  %149 = select i1 %139, float 0x3EF0000000000000, float 1.000000e+00
  %150 = fneg float %147
  %151 = tail call float @llvm.fma.f32(float %150, float %142, float %141)
  %152 = fcmp ogt float %151, 0.000000e+00
  %153 = fneg float %145
  %154 = tail call float @llvm.fma.f32(float %153, float %142, float %141)
  %155 = fcmp ole float %154, 0.000000e+00
  %156 = select i1 %155, float %145, float %142
  %157 = select i1 %152, float %147, float %156
  %158 = fmul float %149, %157
  %159 = select i1 %148, float %141, float %158
  %160 = fmul contract float %159, %138
  %161 = fmul contract float %59, %3
  %162 = fadd contract float %39, %161
  %163 = fadd contract float %162, %160
  store float %163, float addrspace(1)* %28, align 4, !tbaa !7
  br label %164

164:                                              ; preds = %25, %10
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
