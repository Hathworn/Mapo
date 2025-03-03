; ModuleID = '../data/hip_kernels/16034/35/main.cu'
source_filename = "../data/hip_kernels/16034/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_asinh(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %217

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp oge double %36, 0x5FF0000000000000
  %38 = select i1 %37, double 0x1FF0000000000000, double 1.000000e+00
  %39 = fmul double %36, %38
  %40 = fmul double %39, %39
  %41 = fneg double %40
  %42 = tail call double @llvm.fma.f64(double %39, double %39, double %41)
  %43 = select i1 %37, double 0x4000000000000, double 1.000000e+00
  %44 = fadd double %43, %40
  %45 = fsub double %44, %40
  %46 = fsub double %44, %45
  %47 = fsub double %40, %46
  %48 = fsub double %43, %45
  %49 = fadd double %48, %47
  %50 = fadd double %42, %49
  %51 = fadd double %44, %50
  %52 = fsub double %51, %44
  %53 = fsub double %50, %52
  %54 = tail call double @llvm.amdgcn.rsq.f64(double %51)
  %55 = fmul double %51, %54
  %56 = fmul double %54, 5.000000e-01
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %57, double %55, double 5.000000e-01)
  %59 = tail call double @llvm.fma.f64(double %56, double %58, double %56)
  %60 = tail call double @llvm.fma.f64(double %55, double %58, double %55)
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double %51)
  %63 = tail call double @llvm.fma.f64(double %62, double %59, double %60)
  %64 = fcmp oeq double %51, 0.000000e+00
  %65 = select i1 %64, double %51, double %63
  %66 = fmul double %65, %65
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %65, double %65, double %67)
  %69 = fsub double %51, %66
  %70 = fsub double %51, %69
  %71 = fsub double %70, %66
  %72 = fadd double %53, %71
  %73 = fsub double %72, %68
  %74 = fadd double %69, %73
  %75 = fmul double %65, 2.000000e+00
  %76 = tail call double @llvm.amdgcn.rcp.f64(double %75)
  %77 = fneg double %75
  %78 = tail call double @llvm.fma.f64(double %77, double %76, double 1.000000e+00)
  %79 = tail call double @llvm.fma.f64(double %78, double %76, double %76)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 1.000000e+00)
  %81 = tail call double @llvm.fma.f64(double %80, double %79, double %79)
  %82 = fmul double %81, %74
  %83 = tail call double @llvm.fma.f64(double %77, double %82, double %74)
  %84 = tail call double @llvm.fma.f64(double %83, double %81, double %82)
  %85 = select i1 %64, double 0.000000e+00, double %84
  %86 = fadd double %65, %85
  %87 = fsub double %86, %65
  %88 = fsub double %85, %87
  %89 = fadd double %39, %86
  %90 = fsub double %89, %39
  %91 = fsub double %89, %90
  %92 = fsub double %39, %91
  %93 = fsub double %86, %90
  %94 = fadd double %93, %92
  %95 = fadd double %88, %94
  %96 = fadd double %89, %95
  %97 = fsub double %96, %89
  %98 = fsub double %95, %97
  %99 = select i1 %37, i32 512, i32 0
  %100 = tail call double @llvm.amdgcn.frexp.mant.f64(double %96)
  %101 = fcmp olt double %100, 0x3FE5555555555555
  %102 = sext i1 %101 to i32
  %103 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %96)
  %104 = add i32 %103, %102
  %105 = sub nsw i32 0, %104
  %106 = tail call double @llvm.amdgcn.ldexp.f64(double %96, i32 %105)
  %107 = tail call double @llvm.amdgcn.ldexp.f64(double %98, i32 %105)
  %108 = fadd double %106, -1.000000e+00
  %109 = fadd double %108, 1.000000e+00
  %110 = fsub double %106, %109
  %111 = fadd double %107, %110
  %112 = fadd double %108, %111
  %113 = fsub double %112, %108
  %114 = fsub double %111, %113
  %115 = fadd double %106, 1.000000e+00
  %116 = fadd double %115, -1.000000e+00
  %117 = fsub double %106, %116
  %118 = fadd double %107, %117
  %119 = fadd double %115, %118
  %120 = fsub double %119, %115
  %121 = fsub double %118, %120
  %122 = tail call double @llvm.amdgcn.rcp.f64(double %119)
  %123 = fneg double %119
  %124 = tail call double @llvm.fma.f64(double %123, double %122, double 1.000000e+00)
  %125 = tail call double @llvm.fma.f64(double %124, double %122, double %122)
  %126 = tail call double @llvm.fma.f64(double %123, double %125, double 1.000000e+00)
  %127 = tail call double @llvm.fma.f64(double %126, double %125, double %125)
  %128 = fmul double %112, %127
  %129 = fmul double %119, %128
  %130 = fneg double %129
  %131 = tail call double @llvm.fma.f64(double %128, double %119, double %130)
  %132 = tail call double @llvm.fma.f64(double %128, double %121, double %131)
  %133 = fadd double %129, %132
  %134 = fsub double %133, %129
  %135 = fsub double %132, %134
  %136 = fsub double %112, %133
  %137 = fsub double %112, %136
  %138 = fsub double %137, %133
  %139 = fadd double %114, %138
  %140 = fsub double %139, %135
  %141 = fadd double %136, %140
  %142 = fsub double %141, %136
  %143 = fsub double %140, %142
  %144 = fmul double %127, %141
  %145 = fmul double %119, %144
  %146 = fneg double %145
  %147 = tail call double @llvm.fma.f64(double %144, double %119, double %146)
  %148 = tail call double @llvm.fma.f64(double %144, double %121, double %147)
  %149 = fadd double %145, %148
  %150 = fsub double %149, %145
  %151 = fsub double %148, %150
  %152 = fsub double %141, %149
  %153 = fsub double %141, %152
  %154 = fsub double %153, %149
  %155 = fadd double %143, %154
  %156 = fsub double %155, %151
  %157 = fadd double %152, %156
  %158 = fmul double %127, %157
  %159 = fadd double %128, %144
  %160 = fsub double %159, %128
  %161 = fsub double %144, %160
  %162 = fadd double %161, %158
  %163 = fadd double %159, %162
  %164 = fsub double %163, %159
  %165 = fsub double %162, %164
  %166 = fmul double %163, %163
  %167 = tail call double @llvm.fma.f64(double %166, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %168 = tail call double @llvm.fma.f64(double %166, double %167, double 0x3FC7474DD7F4DF2E)
  %169 = tail call double @llvm.fma.f64(double %166, double %168, double 0x3FCC71C016291751)
  %170 = tail call double @llvm.fma.f64(double %166, double %169, double 0x3FD249249B27ACF1)
  %171 = tail call double @llvm.fma.f64(double %166, double %170, double 0x3FD99999998EF7B6)
  %172 = tail call double @llvm.fma.f64(double %166, double %171, double 0x3FE5555555555780)
  %173 = add nsw i32 %104, %99
  %174 = sitofp i32 %173 to double
  %175 = fmul double %174, 0x3FE62E42FEFA39EF
  %176 = fneg double %175
  %177 = tail call double @llvm.fma.f64(double %174, double 0x3FE62E42FEFA39EF, double %176)
  %178 = tail call double @llvm.fma.f64(double %174, double 0x3C7ABC9E3B39803F, double %177)
  %179 = fadd double %175, %178
  %180 = fsub double %179, %175
  %181 = fsub double %178, %180
  %182 = tail call double @llvm.amdgcn.ldexp.f64(double %163, i32 1)
  %183 = tail call double @llvm.amdgcn.ldexp.f64(double %165, i32 1)
  %184 = fmul double %163, %166
  %185 = fmul double %184, %172
  %186 = fadd double %182, %185
  %187 = fsub double %186, %182
  %188 = fsub double %185, %187
  %189 = fadd double %183, %188
  %190 = fadd double %186, %189
  %191 = fsub double %190, %186
  %192 = fsub double %189, %191
  %193 = fadd double %179, %190
  %194 = fsub double %193, %179
  %195 = fsub double %193, %194
  %196 = fsub double %179, %195
  %197 = fsub double %190, %194
  %198 = fadd double %197, %196
  %199 = fadd double %181, %192
  %200 = fsub double %199, %181
  %201 = fsub double %199, %200
  %202 = fsub double %181, %201
  %203 = fsub double %192, %200
  %204 = fadd double %203, %202
  %205 = fadd double %199, %198
  %206 = fadd double %193, %205
  %207 = fsub double %206, %193
  %208 = fsub double %205, %207
  %209 = fadd double %204, %208
  %210 = fadd double %206, %209
  %211 = fcmp olt double %36, 0x3E40000000000000
  %212 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 512)
  %213 = select i1 %212, i1 true, i1 %211
  %214 = select i1 %213, double %36, double %210
  %215 = tail call double @llvm.copysign.f64(double %214, double %35)
  %216 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %215, double addrspace(1)* %216, align 8, !tbaa !16
  br label %217

217:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

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
