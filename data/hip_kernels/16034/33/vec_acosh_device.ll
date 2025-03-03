; ModuleID = '../data/hip_kernels/16034/33/main.cu'
source_filename = "../data/hip_kernels/16034/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_acosh(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %215

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fcmp oge double %35, 0x5FF0000000000000
  %37 = select i1 %36, double 0x1FF0000000000000, double 1.000000e+00
  %38 = fmul double %35, %37
  %39 = fmul double %38, %38
  %40 = fneg double %39
  %41 = tail call double @llvm.fma.f64(double %38, double %38, double %40)
  %42 = select i1 %36, double 0x4000000000000, double 1.000000e+00
  %43 = fsub double %39, %42
  %44 = fsub double %43, %39
  %45 = fsub double %43, %44
  %46 = fsub double %39, %45
  %47 = fadd double %42, %44
  %48 = fsub double %46, %47
  %49 = fadd double %41, %48
  %50 = fadd double %43, %49
  %51 = fsub double %50, %43
  %52 = fsub double %49, %51
  %53 = tail call double @llvm.amdgcn.rsq.f64(double %50)
  %54 = fmul double %50, %53
  %55 = fmul double %53, 5.000000e-01
  %56 = fneg double %55
  %57 = tail call double @llvm.fma.f64(double %56, double %54, double 5.000000e-01)
  %58 = tail call double @llvm.fma.f64(double %55, double %57, double %55)
  %59 = tail call double @llvm.fma.f64(double %54, double %57, double %54)
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %60, double %59, double %50)
  %62 = tail call double @llvm.fma.f64(double %61, double %58, double %59)
  %63 = fcmp oeq double %50, 0.000000e+00
  %64 = select i1 %63, double %50, double %62
  %65 = fmul double %64, %64
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %64, double %64, double %66)
  %68 = fsub double %50, %65
  %69 = fsub double %50, %68
  %70 = fsub double %69, %65
  %71 = fadd double %52, %70
  %72 = fsub double %71, %67
  %73 = fadd double %68, %72
  %74 = fmul double %64, 2.000000e+00
  %75 = tail call double @llvm.amdgcn.rcp.f64(double %74)
  %76 = fneg double %74
  %77 = tail call double @llvm.fma.f64(double %76, double %75, double 1.000000e+00)
  %78 = tail call double @llvm.fma.f64(double %77, double %75, double %75)
  %79 = tail call double @llvm.fma.f64(double %76, double %78, double 1.000000e+00)
  %80 = tail call double @llvm.fma.f64(double %79, double %78, double %78)
  %81 = fmul double %80, %73
  %82 = tail call double @llvm.fma.f64(double %76, double %81, double %73)
  %83 = tail call double @llvm.fma.f64(double %82, double %80, double %81)
  %84 = select i1 %63, double 0.000000e+00, double %83
  %85 = fadd double %64, %84
  %86 = fsub double %85, %64
  %87 = fsub double %84, %86
  %88 = fadd double %38, %85
  %89 = fsub double %88, %38
  %90 = fsub double %88, %89
  %91 = fsub double %38, %90
  %92 = fsub double %85, %89
  %93 = fadd double %92, %91
  %94 = fadd double %87, %93
  %95 = fadd double %88, %94
  %96 = fsub double %95, %88
  %97 = fsub double %94, %96
  %98 = select i1 %36, i32 512, i32 0
  %99 = tail call double @llvm.amdgcn.frexp.mant.f64(double %95)
  %100 = fcmp olt double %99, 0x3FE5555555555555
  %101 = sext i1 %100 to i32
  %102 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %95)
  %103 = add i32 %102, %101
  %104 = sub nsw i32 0, %103
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %95, i32 %104)
  %106 = tail call double @llvm.amdgcn.ldexp.f64(double %97, i32 %104)
  %107 = fadd double %105, -1.000000e+00
  %108 = fadd double %107, 1.000000e+00
  %109 = fsub double %105, %108
  %110 = fadd double %106, %109
  %111 = fadd double %107, %110
  %112 = fsub double %111, %107
  %113 = fsub double %110, %112
  %114 = fadd double %105, 1.000000e+00
  %115 = fadd double %114, -1.000000e+00
  %116 = fsub double %105, %115
  %117 = fadd double %106, %116
  %118 = fadd double %114, %117
  %119 = fsub double %118, %114
  %120 = fsub double %117, %119
  %121 = tail call double @llvm.amdgcn.rcp.f64(double %118)
  %122 = fneg double %118
  %123 = tail call double @llvm.fma.f64(double %122, double %121, double 1.000000e+00)
  %124 = tail call double @llvm.fma.f64(double %123, double %121, double %121)
  %125 = tail call double @llvm.fma.f64(double %122, double %124, double 1.000000e+00)
  %126 = tail call double @llvm.fma.f64(double %125, double %124, double %124)
  %127 = fmul double %111, %126
  %128 = fmul double %118, %127
  %129 = fneg double %128
  %130 = tail call double @llvm.fma.f64(double %127, double %118, double %129)
  %131 = tail call double @llvm.fma.f64(double %127, double %120, double %130)
  %132 = fadd double %128, %131
  %133 = fsub double %132, %128
  %134 = fsub double %131, %133
  %135 = fsub double %111, %132
  %136 = fsub double %111, %135
  %137 = fsub double %136, %132
  %138 = fadd double %113, %137
  %139 = fsub double %138, %134
  %140 = fadd double %135, %139
  %141 = fsub double %140, %135
  %142 = fsub double %139, %141
  %143 = fmul double %126, %140
  %144 = fmul double %118, %143
  %145 = fneg double %144
  %146 = tail call double @llvm.fma.f64(double %143, double %118, double %145)
  %147 = tail call double @llvm.fma.f64(double %143, double %120, double %146)
  %148 = fadd double %144, %147
  %149 = fsub double %148, %144
  %150 = fsub double %147, %149
  %151 = fsub double %140, %148
  %152 = fsub double %140, %151
  %153 = fsub double %152, %148
  %154 = fadd double %142, %153
  %155 = fsub double %154, %150
  %156 = fadd double %151, %155
  %157 = fmul double %126, %156
  %158 = fadd double %127, %143
  %159 = fsub double %158, %127
  %160 = fsub double %143, %159
  %161 = fadd double %160, %157
  %162 = fadd double %158, %161
  %163 = fsub double %162, %158
  %164 = fsub double %161, %163
  %165 = fmul double %162, %162
  %166 = tail call double @llvm.fma.f64(double %165, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %167 = tail call double @llvm.fma.f64(double %165, double %166, double 0x3FC7474DD7F4DF2E)
  %168 = tail call double @llvm.fma.f64(double %165, double %167, double 0x3FCC71C016291751)
  %169 = tail call double @llvm.fma.f64(double %165, double %168, double 0x3FD249249B27ACF1)
  %170 = tail call double @llvm.fma.f64(double %165, double %169, double 0x3FD99999998EF7B6)
  %171 = tail call double @llvm.fma.f64(double %165, double %170, double 0x3FE5555555555780)
  %172 = add nsw i32 %103, %98
  %173 = sitofp i32 %172 to double
  %174 = fmul double %173, 0x3FE62E42FEFA39EF
  %175 = fneg double %174
  %176 = tail call double @llvm.fma.f64(double %173, double 0x3FE62E42FEFA39EF, double %175)
  %177 = tail call double @llvm.fma.f64(double %173, double 0x3C7ABC9E3B39803F, double %176)
  %178 = fadd double %174, %177
  %179 = fsub double %178, %174
  %180 = fsub double %177, %179
  %181 = tail call double @llvm.amdgcn.ldexp.f64(double %162, i32 1)
  %182 = tail call double @llvm.amdgcn.ldexp.f64(double %164, i32 1)
  %183 = fmul double %162, %165
  %184 = fmul double %183, %171
  %185 = fadd double %181, %184
  %186 = fsub double %185, %181
  %187 = fsub double %184, %186
  %188 = fadd double %182, %187
  %189 = fadd double %185, %188
  %190 = fsub double %189, %185
  %191 = fsub double %188, %190
  %192 = fadd double %178, %189
  %193 = fsub double %192, %178
  %194 = fsub double %192, %193
  %195 = fsub double %178, %194
  %196 = fsub double %189, %193
  %197 = fadd double %196, %195
  %198 = fadd double %180, %191
  %199 = fsub double %198, %180
  %200 = fsub double %198, %199
  %201 = fsub double %180, %200
  %202 = fsub double %191, %199
  %203 = fadd double %202, %201
  %204 = fadd double %198, %197
  %205 = fadd double %192, %204
  %206 = fsub double %205, %192
  %207 = fsub double %204, %206
  %208 = fadd double %203, %207
  %209 = fadd double %205, %208
  %210 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 512)
  %211 = select i1 %210, double %35, double %209
  %212 = fcmp olt double %35, 1.000000e+00
  %213 = select i1 %212, double 0x7FF8000000000000, double %211
  %214 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %213, double addrspace(1)* %214, align 8, !tbaa !16
  br label %215

215:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
