; ModuleID = '../data/hip_kernels/1143/57/main.cu'
source_filename = "../data/hip_kernels/1143/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ktest_AxPdS_S_ddddddddS_(double addrspace(1)* nocapture readnone %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, double %3, double %4, double %5, double %6, double %7, double %8, double %9, double %10, double addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !15
  %26 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %25, %29
  %31 = mul i32 %13, %29
  %32 = getelementptr i8, i8 addrspace(4)* %14, i64 8
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 4, !range !13, !invariant.load !14
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %36 = add i32 %31, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !17, !amdgpu.noclobber !14
  %40 = fmul contract double %39, 1.000000e+05
  %41 = tail call double @llvm.fabs.f64(double %40)
  %42 = fcmp olt double %41, 0x41D0000000000000
  br i1 %42, label %43, label %62

43:                                               ; preds = %12
  %44 = fmul double %41, 0x3FE45F306DC9C883
  %45 = tail call double @llvm.rint.f64(double %44)
  %46 = tail call double @llvm.fma.f64(double %45, double 0xBFF921FB54442D18, double %41)
  %47 = tail call double @llvm.fma.f64(double %45, double 0xBC91A62633145C00, double %46)
  %48 = fmul double %45, 0x3C91A62633145C00
  %49 = fneg double %48
  %50 = tail call double @llvm.fma.f64(double %45, double 0x3C91A62633145C00, double %49)
  %51 = fsub double %46, %48
  %52 = fsub double %46, %51
  %53 = fsub double %52, %48
  %54 = fsub double %51, %47
  %55 = fadd double %54, %53
  %56 = fsub double %55, %50
  %57 = tail call double @llvm.fma.f64(double %45, double 0xB97B839A252049C0, double %56)
  %58 = fadd double %47, %57
  %59 = fsub double %58, %47
  %60 = fsub double %57, %59
  %61 = fptosi double %45 to i32
  br label %138

62:                                               ; preds = %12
  %63 = tail call double @llvm.amdgcn.trig.preop.f64(double %41, i32 0)
  %64 = tail call double @llvm.amdgcn.trig.preop.f64(double %41, i32 1)
  %65 = tail call double @llvm.amdgcn.trig.preop.f64(double %41, i32 2)
  %66 = fcmp oge double %41, 0x7B00000000000000
  %67 = tail call double @llvm.amdgcn.ldexp.f64(double %41, i32 -128)
  %68 = select i1 %66, double %67, double %41
  %69 = fmul double %65, %68
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %65, double %68, double %70)
  %72 = fmul double %64, %68
  %73 = fneg double %72
  %74 = tail call double @llvm.fma.f64(double %64, double %68, double %73)
  %75 = fmul double %63, %68
  %76 = fneg double %75
  %77 = tail call double @llvm.fma.f64(double %63, double %68, double %76)
  %78 = fadd double %72, %77
  %79 = fsub double %78, %72
  %80 = fsub double %78, %79
  %81 = fsub double %77, %79
  %82 = fsub double %72, %80
  %83 = fadd double %81, %82
  %84 = fadd double %69, %74
  %85 = fsub double %84, %69
  %86 = fsub double %84, %85
  %87 = fsub double %74, %85
  %88 = fsub double %69, %86
  %89 = fadd double %87, %88
  %90 = fadd double %84, %83
  %91 = fsub double %90, %84
  %92 = fsub double %90, %91
  %93 = fsub double %83, %91
  %94 = fsub double %84, %92
  %95 = fadd double %93, %94
  %96 = fadd double %89, %95
  %97 = fadd double %71, %96
  %98 = fadd double %75, %78
  %99 = fsub double %98, %75
  %100 = fsub double %78, %99
  %101 = fadd double %100, %90
  %102 = fsub double %101, %100
  %103 = fsub double %90, %102
  %104 = fadd double %103, %97
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %98, i32 -2)
  %106 = tail call double @llvm.amdgcn.fract.f64(double %105)
  %107 = tail call i1 @llvm.amdgcn.class.f64(double %105, i32 516)
  %108 = select i1 %107, double 0.000000e+00, double %106
  %109 = tail call double @llvm.amdgcn.ldexp.f64(double %108, i32 2)
  %110 = fadd double %109, %101
  %111 = fcmp olt double %110, 0.000000e+00
  %112 = select i1 %111, double 4.000000e+00, double 0.000000e+00
  %113 = fadd double %109, %112
  %114 = fadd double %101, %113
  %115 = fptosi double %114 to i32
  %116 = sitofp i32 %115 to double
  %117 = fsub double %113, %116
  %118 = fadd double %101, %117
  %119 = fsub double %118, %117
  %120 = fsub double %101, %119
  %121 = fadd double %104, %120
  %122 = fcmp oge double %118, 5.000000e-01
  %123 = zext i1 %122 to i32
  %124 = add nsw i32 %123, %115
  %125 = select i1 %122, double 1.000000e+00, double 0.000000e+00
  %126 = fsub double %118, %125
  %127 = fadd double %126, %121
  %128 = fsub double %127, %126
  %129 = fsub double %121, %128
  %130 = fmul double %127, 0x3FF921FB54442D18
  %131 = fneg double %130
  %132 = tail call double @llvm.fma.f64(double %127, double 0x3FF921FB54442D18, double %131)
  %133 = tail call double @llvm.fma.f64(double %127, double 0x3C91A62633145C07, double %132)
  %134 = tail call double @llvm.fma.f64(double %129, double 0x3FF921FB54442D18, double %133)
  %135 = fadd double %130, %134
  %136 = fsub double %135, %130
  %137 = fsub double %134, %136
  br label %138

138:                                              ; preds = %43, %62
  %139 = phi double [ %60, %43 ], [ %137, %62 ]
  %140 = phi double [ %58, %43 ], [ %135, %62 ]
  %141 = phi i32 [ %61, %43 ], [ %124, %62 ]
  %142 = mul i32 %30, %29
  %143 = icmp ugt i32 %25, %142
  %144 = zext i1 %143 to i32
  %145 = add i32 %30, %144
  %146 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %147 = mul i32 %145, %146
  %148 = add i32 %147, %13
  %149 = mul i32 %22, %21
  %150 = icmp ugt i32 %17, %149
  %151 = zext i1 %150 to i32
  %152 = add i32 %22, %151
  %153 = mul i32 %148, %152
  %154 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %155 = add i32 %153, %154
  %156 = zext i16 %34 to i32
  %157 = mul i32 %155, %156
  %158 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %159 = add i32 %157, %158
  %160 = mul i32 %159, %29
  %161 = add i32 %160, %35
  %162 = mul i32 %161, %21
  %163 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %164 = add i32 %162, %163
  %165 = fmul double %140, %140
  %166 = fmul double %165, 5.000000e-01
  %167 = fsub double 1.000000e+00, %166
  %168 = fsub double 1.000000e+00, %167
  %169 = fsub double %168, %166
  %170 = fmul double %165, %165
  %171 = tail call double @llvm.fma.f64(double %165, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %172 = tail call double @llvm.fma.f64(double %165, double %171, double 0xBE927E4FA17F65F6)
  %173 = tail call double @llvm.fma.f64(double %165, double %172, double 0x3EFA01A019F4EC90)
  %174 = tail call double @llvm.fma.f64(double %165, double %173, double 0xBF56C16C16C16967)
  %175 = tail call double @llvm.fma.f64(double %165, double %174, double 0x3FA5555555555555)
  %176 = fneg double %139
  %177 = tail call double @llvm.fma.f64(double %140, double %176, double %169)
  %178 = tail call double @llvm.fma.f64(double %170, double %175, double %177)
  %179 = fadd double %167, %178
  %180 = tail call double @llvm.fma.f64(double %165, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %181 = tail call double @llvm.fma.f64(double %165, double %180, double 0x3EC71DE3796CDE01)
  %182 = tail call double @llvm.fma.f64(double %165, double %181, double 0xBF2A01A019E83E5C)
  %183 = tail call double @llvm.fma.f64(double %165, double %182, double 0x3F81111111110BB3)
  %184 = fneg double %165
  %185 = fmul double %140, %184
  %186 = fmul double %139, 5.000000e-01
  %187 = tail call double @llvm.fma.f64(double %185, double %183, double %186)
  %188 = tail call double @llvm.fma.f64(double %165, double %187, double %176)
  %189 = tail call double @llvm.fma.f64(double %185, double 0xBFC5555555555555, double %188)
  %190 = fsub double %140, %189
  %191 = and i32 %141, 1
  %192 = icmp eq i32 %191, 0
  %193 = select i1 %192, double %190, double %179
  %194 = bitcast double %193 to <2 x i32>
  %195 = shl i32 %141, 30
  %196 = bitcast double %40 to <2 x i32>
  %197 = extractelement <2 x i32> %196, i64 1
  %198 = xor i32 %195, %197
  %199 = and i32 %198, -2147483648
  %200 = extractelement <2 x i32> %194, i64 1
  %201 = xor i32 %200, %199
  %202 = insertelement <2 x i32> %194, i32 %201, i64 1
  %203 = tail call i1 @llvm.amdgcn.class.f64(double %41, i32 504)
  %204 = select i1 %203, <2 x i32> %202, <2 x i32> <i32 0, i32 2146959360>
  %205 = bitcast <2 x i32> %204 to double
  %206 = fadd contract double %205, 1.000000e+00
  %207 = fmul contract double %206, %4
  %208 = fmul contract double %207, %9
  %209 = sext i32 %164 to i64
  %210 = getelementptr inbounds double, double addrspace(1)* %11, i64 %209
  store double %208, double addrspace(1)* %210, align 8, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
