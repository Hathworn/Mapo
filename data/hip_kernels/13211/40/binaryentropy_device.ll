; ModuleID = '../data/hip_kernels/13211/40/main.cu'
source_filename = "../data/hip_kernels/13211/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13binaryentropyiPKdS0_Pd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %197

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %1, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds double, double addrspace(1)* %2, i64 %16
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !6
  %21 = fdiv contract double %18, %20
  %22 = tail call double @llvm.amdgcn.frexp.mant.f64(double %21)
  %23 = fcmp olt double %22, 0x3FE5555555555555
  %24 = zext i1 %23 to i32
  %25 = tail call double @llvm.amdgcn.ldexp.f64(double %22, i32 %24)
  %26 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %21)
  %27 = sub nsw i32 %26, %24
  %28 = fadd double %25, -1.000000e+00
  %29 = fadd double %25, 1.000000e+00
  %30 = fadd double %29, -1.000000e+00
  %31 = fsub double %25, %30
  %32 = tail call double @llvm.amdgcn.rcp.f64(double %29)
  %33 = fneg double %29
  %34 = tail call double @llvm.fma.f64(double %33, double %32, double 1.000000e+00)
  %35 = tail call double @llvm.fma.f64(double %34, double %32, double %32)
  %36 = tail call double @llvm.fma.f64(double %33, double %35, double 1.000000e+00)
  %37 = tail call double @llvm.fma.f64(double %36, double %35, double %35)
  %38 = fmul double %28, %37
  %39 = fmul double %29, %38
  %40 = fneg double %39
  %41 = tail call double @llvm.fma.f64(double %38, double %29, double %40)
  %42 = tail call double @llvm.fma.f64(double %38, double %31, double %41)
  %43 = fadd double %39, %42
  %44 = fsub double %43, %39
  %45 = fsub double %42, %44
  %46 = fsub double %28, %43
  %47 = fsub double %28, %46
  %48 = fsub double %47, %43
  %49 = fsub double %48, %45
  %50 = fadd double %46, %49
  %51 = fmul double %37, %50
  %52 = fadd double %38, %51
  %53 = fsub double %52, %38
  %54 = fsub double %51, %53
  %55 = fmul double %52, %52
  %56 = tail call double @llvm.fma.f64(double %55, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %57 = tail call double @llvm.fma.f64(double %55, double %56, double 0x3FC7474DD7F4DF2E)
  %58 = tail call double @llvm.fma.f64(double %55, double %57, double 0x3FCC71C016291751)
  %59 = tail call double @llvm.fma.f64(double %55, double %58, double 0x3FD249249B27ACF1)
  %60 = tail call double @llvm.fma.f64(double %55, double %59, double 0x3FD99999998EF7B6)
  %61 = tail call double @llvm.fma.f64(double %55, double %60, double 0x3FE5555555555780)
  %62 = tail call double @llvm.amdgcn.ldexp.f64(double %52, i32 1)
  %63 = tail call double @llvm.amdgcn.ldexp.f64(double %54, i32 1)
  %64 = fmul double %52, %55
  %65 = fmul double %64, %61
  %66 = fadd double %62, %65
  %67 = fsub double %66, %62
  %68 = fsub double %65, %67
  %69 = fadd double %63, %68
  %70 = fadd double %66, %69
  %71 = fsub double %70, %66
  %72 = fsub double %69, %71
  %73 = sitofp i32 %27 to double
  %74 = fmul double %73, 0x3FE62E42FEFA39EF
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %73, double 0x3FE62E42FEFA39EF, double %75)
  %77 = tail call double @llvm.fma.f64(double %73, double 0x3C7ABC9E3B39803F, double %76)
  %78 = fadd double %74, %77
  %79 = fsub double %78, %74
  %80 = fsub double %77, %79
  %81 = fadd double %78, %70
  %82 = fsub double %81, %78
  %83 = fsub double %81, %82
  %84 = fsub double %78, %83
  %85 = fsub double %70, %82
  %86 = fadd double %85, %84
  %87 = fadd double %80, %72
  %88 = fsub double %87, %80
  %89 = fsub double %87, %88
  %90 = fsub double %80, %89
  %91 = fsub double %72, %88
  %92 = fadd double %91, %90
  %93 = fadd double %87, %86
  %94 = fadd double %81, %93
  %95 = fsub double %94, %81
  %96 = fsub double %93, %95
  %97 = fadd double %92, %96
  %98 = fadd double %94, %97
  %99 = tail call double @llvm.fabs.f64(double %21) #3
  %100 = fcmp oeq double %99, 0x7FF0000000000000
  %101 = select i1 %100, double %21, double %98
  %102 = fcmp olt double %21, 0.000000e+00
  %103 = select i1 %102, double 0x7FF8000000000000, double %101
  %104 = fcmp oeq double %21, 0.000000e+00
  %105 = select i1 %104, double 0xFFF0000000000000, double %103
  %106 = fmul contract double %18, %105
  %107 = fsub contract double 1.000000e+00, %18
  %108 = fsub contract double 1.000000e+00, %20
  %109 = fdiv contract double %107, %108
  %110 = tail call double @llvm.amdgcn.frexp.mant.f64(double %109)
  %111 = fcmp olt double %110, 0x3FE5555555555555
  %112 = zext i1 %111 to i32
  %113 = tail call double @llvm.amdgcn.ldexp.f64(double %110, i32 %112)
  %114 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %109)
  %115 = sub nsw i32 %114, %112
  %116 = fadd double %113, -1.000000e+00
  %117 = fadd double %113, 1.000000e+00
  %118 = fadd double %117, -1.000000e+00
  %119 = fsub double %113, %118
  %120 = tail call double @llvm.amdgcn.rcp.f64(double %117)
  %121 = fneg double %117
  %122 = tail call double @llvm.fma.f64(double %121, double %120, double 1.000000e+00)
  %123 = tail call double @llvm.fma.f64(double %122, double %120, double %120)
  %124 = tail call double @llvm.fma.f64(double %121, double %123, double 1.000000e+00)
  %125 = tail call double @llvm.fma.f64(double %124, double %123, double %123)
  %126 = fmul double %116, %125
  %127 = fmul double %117, %126
  %128 = fneg double %127
  %129 = tail call double @llvm.fma.f64(double %126, double %117, double %128)
  %130 = tail call double @llvm.fma.f64(double %126, double %119, double %129)
  %131 = fadd double %127, %130
  %132 = fsub double %131, %127
  %133 = fsub double %130, %132
  %134 = fsub double %116, %131
  %135 = fsub double %116, %134
  %136 = fsub double %135, %131
  %137 = fsub double %136, %133
  %138 = fadd double %134, %137
  %139 = fmul double %125, %138
  %140 = fadd double %126, %139
  %141 = fsub double %140, %126
  %142 = fsub double %139, %141
  %143 = fmul double %140, %140
  %144 = tail call double @llvm.fma.f64(double %143, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %145 = tail call double @llvm.fma.f64(double %143, double %144, double 0x3FC7474DD7F4DF2E)
  %146 = tail call double @llvm.fma.f64(double %143, double %145, double 0x3FCC71C016291751)
  %147 = tail call double @llvm.fma.f64(double %143, double %146, double 0x3FD249249B27ACF1)
  %148 = tail call double @llvm.fma.f64(double %143, double %147, double 0x3FD99999998EF7B6)
  %149 = tail call double @llvm.fma.f64(double %143, double %148, double 0x3FE5555555555780)
  %150 = tail call double @llvm.amdgcn.ldexp.f64(double %140, i32 1)
  %151 = tail call double @llvm.amdgcn.ldexp.f64(double %142, i32 1)
  %152 = fmul double %140, %143
  %153 = fmul double %152, %149
  %154 = fadd double %150, %153
  %155 = fsub double %154, %150
  %156 = fsub double %153, %155
  %157 = fadd double %151, %156
  %158 = fadd double %154, %157
  %159 = fsub double %158, %154
  %160 = fsub double %157, %159
  %161 = sitofp i32 %115 to double
  %162 = fmul double %161, 0x3FE62E42FEFA39EF
  %163 = fneg double %162
  %164 = tail call double @llvm.fma.f64(double %161, double 0x3FE62E42FEFA39EF, double %163)
  %165 = tail call double @llvm.fma.f64(double %161, double 0x3C7ABC9E3B39803F, double %164)
  %166 = fadd double %162, %165
  %167 = fsub double %166, %162
  %168 = fsub double %165, %167
  %169 = fadd double %166, %158
  %170 = fsub double %169, %166
  %171 = fsub double %169, %170
  %172 = fsub double %166, %171
  %173 = fsub double %158, %170
  %174 = fadd double %173, %172
  %175 = fadd double %168, %160
  %176 = fsub double %175, %168
  %177 = fsub double %175, %176
  %178 = fsub double %168, %177
  %179 = fsub double %160, %176
  %180 = fadd double %179, %178
  %181 = fadd double %175, %174
  %182 = fadd double %169, %181
  %183 = fsub double %182, %169
  %184 = fsub double %181, %183
  %185 = fadd double %180, %184
  %186 = fadd double %182, %185
  %187 = tail call double @llvm.fabs.f64(double %109) #3
  %188 = fcmp oeq double %187, 0x7FF0000000000000
  %189 = select i1 %188, double %109, double %186
  %190 = fcmp olt double %109, 0.000000e+00
  %191 = select i1 %190, double 0x7FF8000000000000, double %189
  %192 = fcmp oeq double %109, 0.000000e+00
  %193 = select i1 %192, double 0xFFF0000000000000, double %191
  %194 = fmul contract double %107, %193
  %195 = fadd contract double %106, %194
  %196 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  store double %195, double addrspace(1)* %196, align 8, !tbaa !7
  br label %197

197:                                              ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
