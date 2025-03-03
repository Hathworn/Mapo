; ModuleID = '../data/hip_kernels/1425/27/main.cu'
source_filename = "../data/hip_kernels/1425/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@matS = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_getRandomRPdS_(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = mul nuw nsw i32 %3, 18
  %13 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @matS, i32 0, i32 %12
  %14 = getelementptr inbounds double, double addrspace(3)* %13, i32 9
  store double 0.000000e+00, double addrspace(3)* %13, align 8, !tbaa !7
  %15 = getelementptr inbounds double, double addrspace(3)* %13, i32 4
  store double 0.000000e+00, double addrspace(3)* %15, align 8, !tbaa !7
  %16 = getelementptr inbounds double, double addrspace(3)* %13, i32 8
  store double 0.000000e+00, double addrspace(3)* %16, align 8, !tbaa !7
  %17 = shl nsw i32 %11, 2
  %18 = add nuw nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7
  %22 = getelementptr inbounds double, double addrspace(3)* %13, i32 5
  store double %21, double addrspace(3)* %22, align 8, !tbaa !7
  %23 = add nuw nsw i32 %17, 2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !7
  %27 = getelementptr inbounds double, double addrspace(3)* %13, i32 6
  store double %26, double addrspace(3)* %27, align 8, !tbaa !7
  %28 = add nuw nsw i32 %17, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = getelementptr inbounds double, double addrspace(3)* %13, i32 1
  store double %31, double addrspace(3)* %32, align 8, !tbaa !7
  %33 = fneg contract double %21
  %34 = getelementptr inbounds double, double addrspace(3)* %13, i32 7
  store double %33, double addrspace(3)* %34, align 8, !tbaa !7
  %35 = fneg contract double %26
  %36 = getelementptr inbounds double, double addrspace(3)* %13, i32 2
  store double %35, double addrspace(3)* %36, align 8, !tbaa !7
  %37 = fneg contract double %31
  %38 = getelementptr inbounds double, double addrspace(3)* %13, i32 3
  store double %37, double addrspace(3)* %38, align 8, !tbaa !7
  %39 = getelementptr inbounds double, double addrspace(3)* %13, i32 10
  %40 = getelementptr inbounds double, double addrspace(3)* %13, i32 11
  %41 = getelementptr inbounds double, double addrspace(3)* %13, i32 12
  %42 = getelementptr inbounds double, double addrspace(3)* %13, i32 13
  %43 = getelementptr inbounds double, double addrspace(3)* %13, i32 14
  %44 = getelementptr inbounds double, double addrspace(3)* %13, i32 15
  %45 = getelementptr inbounds double, double addrspace(3)* %13, i32 16
  %46 = getelementptr inbounds double, double addrspace(3)* %13, i32 17
  %47 = fmul contract double %31, %31
  %48 = fsub contract double 0.000000e+00, %47
  %49 = fmul contract double %26, %35
  %50 = fadd contract double %48, %49
  store double %50, double addrspace(3)* %14, align 8, !tbaa !7
  %51 = fmul contract double %31, -0.000000e+00
  %52 = fadd contract double %51, 0.000000e+00
  %53 = fadd contract double %52, %51
  %54 = fmul contract double %26, %21
  %55 = fadd contract double %53, %54
  store double %55, double addrspace(3)* %41, align 8, !tbaa !7
  %56 = fmul contract double %26, 0.000000e+00
  %57 = fadd contract double %56, 0.000000e+00
  %58 = fmul contract double %31, %21
  %59 = fadd contract double %57, %58
  %60 = fadd contract double %59, %56
  store double %60, double addrspace(3)* %44, align 8, !tbaa !7
  %61 = fmul contract double %31, 0.000000e+00
  %62 = fadd contract double %61, 0.000000e+00
  %63 = fadd contract double %62, %61
  %64 = fmul contract double %21, %26
  %65 = fadd contract double %63, %64
  store double %65, double addrspace(3)* %39, align 8, !tbaa !7
  %66 = fadd contract double %48, 0.000000e+00
  %67 = fmul contract double %21, %21
  %68 = fsub contract double %66, %67
  store double %68, double addrspace(3)* %42, align 8, !tbaa !7
  %69 = fmul contract double %31, %26
  %70 = fadd contract double %69, 0.000000e+00
  %71 = fmul contract double %21, -0.000000e+00
  %72 = fadd contract double %70, %71
  %73 = fadd contract double %72, %71
  store double %73, double addrspace(3)* %45, align 8, !tbaa !7
  %74 = fmul contract double %26, -0.000000e+00
  %75 = fadd contract double %74, 0.000000e+00
  %76 = fmul contract double %21, %31
  %77 = fadd contract double %75, %76
  %78 = fadd contract double %77, %74
  store double %78, double addrspace(3)* %40, align 8, !tbaa !7
  %79 = fmul contract double %26, %31
  %80 = fadd contract double %79, 0.000000e+00
  %81 = load double, double addrspace(3)* %15, align 8, !tbaa !7
  %82 = fmul contract double %21, %81
  %83 = fadd contract double %80, %82
  %84 = load double, double addrspace(3)* %16, align 8, !tbaa !7
  %85 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %86 = fmul contract double %84, %85
  %87 = fadd contract double %83, %86
  store double %87, double addrspace(3)* %43, align 8, !tbaa !7
  %88 = fadd contract double %49, 0.000000e+00
  %89 = fmul contract double %21, %85
  %90 = fsub contract double %88, %89
  %91 = fmul contract double %84, %84
  %92 = fadd contract double %90, %91
  store double %92, double addrspace(3)* %46, align 8, !tbaa !7
  %93 = sext i32 %17 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7, !amdgpu.noclobber !6
  %96 = fmul contract double %95, 2.000000e+00
  %97 = load double, double addrspace(3)* %13, align 8, !tbaa !7
  %98 = fmul contract double %96, %97
  %99 = fmul contract double %50, 2.000000e+00
  %100 = fadd contract double %98, %99
  %101 = load double, double addrspace(3)* %32, align 8, !tbaa !7
  %102 = fmul contract double %96, %101
  %103 = fmul contract double %65, 2.000000e+00
  %104 = fadd contract double %102, %103
  store double %104, double addrspace(3)* %32, align 8, !tbaa !7
  %105 = load double, double addrspace(3)* %36, align 8, !tbaa !7
  %106 = fmul contract double %96, %105
  %107 = fmul contract double %78, 2.000000e+00
  %108 = fadd contract double %106, %107
  store double %108, double addrspace(3)* %36, align 8, !tbaa !7
  %109 = load double, double addrspace(3)* %38, align 8, !tbaa !7
  %110 = fmul contract double %96, %109
  %111 = fmul contract double %55, 2.000000e+00
  %112 = fadd contract double %110, %111
  store double %112, double addrspace(3)* %38, align 8, !tbaa !7
  %113 = fmul contract double %96, %81
  %114 = fmul contract double %68, 2.000000e+00
  %115 = fadd contract double %113, %114
  %116 = fmul contract double %96, %85
  %117 = fmul contract double %87, 2.000000e+00
  %118 = fadd contract double %116, %117
  store double %118, double addrspace(3)* %22, align 8, !tbaa !7
  %119 = load double, double addrspace(3)* %27, align 8, !tbaa !7
  %120 = fmul contract double %96, %119
  %121 = fmul contract double %60, 2.000000e+00
  %122 = fadd contract double %120, %121
  store double %122, double addrspace(3)* %27, align 8, !tbaa !7
  %123 = load double, double addrspace(3)* %34, align 8, !tbaa !7
  %124 = fmul contract double %96, %123
  %125 = fmul contract double %73, 2.000000e+00
  %126 = fadd contract double %124, %125
  store double %126, double addrspace(3)* %34, align 8, !tbaa !7
  %127 = fmul contract double %96, %84
  %128 = fmul contract double %92, 2.000000e+00
  %129 = fadd contract double %127, %128
  %130 = fadd contract double %100, 1.000000e+00
  store double %130, double addrspace(3)* %13, align 8, !tbaa !7
  %131 = fadd contract double %115, 1.000000e+00
  store double %131, double addrspace(3)* %15, align 8, !tbaa !7
  %132 = fadd contract double %129, 1.000000e+00
  store double %132, double addrspace(3)* %16, align 8, !tbaa !7
  %133 = mul nsw i32 %11, 9
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double, double addrspace(1)* %0, i64 %134
  store double %130, double addrspace(1)* %135, align 8, !tbaa !7
  %136 = add nsw i32 %133, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %0, i64 %137
  store double %104, double addrspace(1)* %138, align 8, !tbaa !7
  %139 = add nsw i32 %133, 2
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %0, i64 %140
  store double %108, double addrspace(1)* %141, align 8, !tbaa !7
  %142 = add nsw i32 %133, 3
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %0, i64 %143
  store double %112, double addrspace(1)* %144, align 8, !tbaa !7
  %145 = add nsw i32 %133, 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %0, i64 %146
  store double %131, double addrspace(1)* %147, align 8, !tbaa !7
  %148 = add nsw i32 %133, 5
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  store double %118, double addrspace(1)* %150, align 8, !tbaa !7
  %151 = add nsw i32 %133, 6
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %0, i64 %152
  store double %122, double addrspace(1)* %153, align 8, !tbaa !7
  %154 = add nsw i32 %133, 7
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %0, i64 %155
  store double %126, double addrspace(1)* %156, align 8, !tbaa !7
  %157 = add nsw i32 %133, 8
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds double, double addrspace(1)* %0, i64 %158
  store double %132, double addrspace(1)* %159, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
