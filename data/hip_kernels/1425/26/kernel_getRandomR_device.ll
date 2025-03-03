; ModuleID = '../data/hip_kernels/1425/26/main.cu'
source_filename = "../data/hip_kernels/1425/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@matS = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_getRandomRPdS_Pi(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = icmp ult i32 %4, %8
  br i1 %9, label %10, label %166

10:                                               ; preds = %3
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !10, !invariant.load !9
  %15 = zext i16 %14 to i32
  %16 = mul i32 %5, %15
  %17 = add i32 %16, %4
  %18 = mul nuw nsw i32 %4, 18
  %19 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @matS, i32 0, i32 %18
  %20 = getelementptr inbounds double, double addrspace(3)* %19, i32 9
  store double 0.000000e+00, double addrspace(3)* %19, align 8, !tbaa !11
  %21 = getelementptr inbounds double, double addrspace(3)* %19, i32 4
  store double 0.000000e+00, double addrspace(3)* %21, align 8, !tbaa !11
  %22 = getelementptr inbounds double, double addrspace(3)* %19, i32 8
  store double 0.000000e+00, double addrspace(3)* %22, align 8, !tbaa !11
  %23 = shl nsw i32 %17, 2
  %24 = add nuw nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !11
  %28 = getelementptr inbounds double, double addrspace(3)* %19, i32 5
  store double %27, double addrspace(3)* %28, align 8, !tbaa !11
  %29 = add nuw nsw i32 %23, 2
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !11
  %33 = getelementptr inbounds double, double addrspace(3)* %19, i32 6
  store double %32, double addrspace(3)* %33, align 8, !tbaa !11
  %34 = add nuw nsw i32 %23, 3
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !11
  %38 = getelementptr inbounds double, double addrspace(3)* %19, i32 1
  store double %37, double addrspace(3)* %38, align 8, !tbaa !11
  %39 = fneg contract double %27
  %40 = getelementptr inbounds double, double addrspace(3)* %19, i32 7
  store double %39, double addrspace(3)* %40, align 8, !tbaa !11
  %41 = fneg contract double %32
  %42 = getelementptr inbounds double, double addrspace(3)* %19, i32 2
  store double %41, double addrspace(3)* %42, align 8, !tbaa !11
  %43 = fneg contract double %37
  %44 = getelementptr inbounds double, double addrspace(3)* %19, i32 3
  store double %43, double addrspace(3)* %44, align 8, !tbaa !11
  %45 = getelementptr inbounds double, double addrspace(3)* %19, i32 10
  %46 = getelementptr inbounds double, double addrspace(3)* %19, i32 11
  %47 = getelementptr inbounds double, double addrspace(3)* %19, i32 12
  %48 = getelementptr inbounds double, double addrspace(3)* %19, i32 13
  %49 = getelementptr inbounds double, double addrspace(3)* %19, i32 14
  %50 = getelementptr inbounds double, double addrspace(3)* %19, i32 15
  %51 = getelementptr inbounds double, double addrspace(3)* %19, i32 16
  %52 = getelementptr inbounds double, double addrspace(3)* %19, i32 17
  %53 = fmul contract double %37, %37
  %54 = fsub contract double 0.000000e+00, %53
  %55 = fmul contract double %32, %41
  %56 = fadd contract double %54, %55
  store double %56, double addrspace(3)* %20, align 8, !tbaa !11
  %57 = fmul contract double %37, -0.000000e+00
  %58 = fadd contract double %57, 0.000000e+00
  %59 = fadd contract double %58, %57
  %60 = fmul contract double %32, %27
  %61 = fadd contract double %59, %60
  store double %61, double addrspace(3)* %47, align 8, !tbaa !11
  %62 = fmul contract double %32, 0.000000e+00
  %63 = fadd contract double %62, 0.000000e+00
  %64 = fmul contract double %37, %27
  %65 = fadd contract double %63, %64
  %66 = fadd contract double %65, %62
  store double %66, double addrspace(3)* %50, align 8, !tbaa !11
  %67 = fmul contract double %37, 0.000000e+00
  %68 = fadd contract double %67, 0.000000e+00
  %69 = fadd contract double %68, %67
  %70 = fmul contract double %27, %32
  %71 = fadd contract double %69, %70
  store double %71, double addrspace(3)* %45, align 8, !tbaa !11
  %72 = fadd contract double %54, 0.000000e+00
  %73 = fmul contract double %27, %27
  %74 = fsub contract double %72, %73
  store double %74, double addrspace(3)* %48, align 8, !tbaa !11
  %75 = fmul contract double %37, %32
  %76 = fadd contract double %75, 0.000000e+00
  %77 = fmul contract double %27, -0.000000e+00
  %78 = fadd contract double %76, %77
  %79 = fadd contract double %78, %77
  store double %79, double addrspace(3)* %51, align 8, !tbaa !11
  %80 = fmul contract double %32, -0.000000e+00
  %81 = fadd contract double %80, 0.000000e+00
  %82 = fmul contract double %27, %37
  %83 = fadd contract double %81, %82
  %84 = fadd contract double %83, %80
  store double %84, double addrspace(3)* %46, align 8, !tbaa !11
  %85 = fmul contract double %32, %37
  %86 = fadd contract double %85, 0.000000e+00
  %87 = load double, double addrspace(3)* %21, align 8, !tbaa !11
  %88 = fmul contract double %27, %87
  %89 = fadd contract double %86, %88
  %90 = load double, double addrspace(3)* %22, align 8, !tbaa !11
  %91 = load double, double addrspace(3)* %28, align 8, !tbaa !11
  %92 = fmul contract double %90, %91
  %93 = fadd contract double %89, %92
  store double %93, double addrspace(3)* %49, align 8, !tbaa !11
  %94 = fadd contract double %55, 0.000000e+00
  %95 = fmul contract double %27, %91
  %96 = fsub contract double %94, %95
  %97 = fmul contract double %90, %90
  %98 = fadd contract double %96, %97
  store double %98, double addrspace(3)* %52, align 8, !tbaa !11
  %99 = sext i32 %23 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !11, !amdgpu.noclobber !9
  %102 = fmul contract double %101, 2.000000e+00
  %103 = load double, double addrspace(3)* %19, align 8, !tbaa !11
  %104 = fmul contract double %102, %103
  %105 = fmul contract double %56, 2.000000e+00
  %106 = fadd contract double %104, %105
  %107 = load double, double addrspace(3)* %38, align 8, !tbaa !11
  %108 = fmul contract double %102, %107
  %109 = fmul contract double %71, 2.000000e+00
  %110 = fadd contract double %108, %109
  store double %110, double addrspace(3)* %38, align 8, !tbaa !11
  %111 = load double, double addrspace(3)* %42, align 8, !tbaa !11
  %112 = fmul contract double %102, %111
  %113 = fmul contract double %84, 2.000000e+00
  %114 = fadd contract double %112, %113
  store double %114, double addrspace(3)* %42, align 8, !tbaa !11
  %115 = load double, double addrspace(3)* %44, align 8, !tbaa !11
  %116 = fmul contract double %102, %115
  %117 = fmul contract double %61, 2.000000e+00
  %118 = fadd contract double %116, %117
  store double %118, double addrspace(3)* %44, align 8, !tbaa !11
  %119 = fmul contract double %102, %87
  %120 = fmul contract double %74, 2.000000e+00
  %121 = fadd contract double %119, %120
  %122 = fmul contract double %102, %91
  %123 = fmul contract double %93, 2.000000e+00
  %124 = fadd contract double %122, %123
  store double %124, double addrspace(3)* %28, align 8, !tbaa !11
  %125 = load double, double addrspace(3)* %33, align 8, !tbaa !11
  %126 = fmul contract double %102, %125
  %127 = fmul contract double %66, 2.000000e+00
  %128 = fadd contract double %126, %127
  store double %128, double addrspace(3)* %33, align 8, !tbaa !11
  %129 = load double, double addrspace(3)* %40, align 8, !tbaa !11
  %130 = fmul contract double %102, %129
  %131 = fmul contract double %79, 2.000000e+00
  %132 = fadd contract double %130, %131
  store double %132, double addrspace(3)* %40, align 8, !tbaa !11
  %133 = fmul contract double %102, %90
  %134 = fmul contract double %98, 2.000000e+00
  %135 = fadd contract double %133, %134
  %136 = fadd contract double %106, 1.000000e+00
  store double %136, double addrspace(3)* %19, align 8, !tbaa !11
  %137 = fadd contract double %121, 1.000000e+00
  store double %137, double addrspace(3)* %21, align 8, !tbaa !11
  %138 = fadd contract double %135, 1.000000e+00
  store double %138, double addrspace(3)* %22, align 8, !tbaa !11
  %139 = mul nsw i32 %17, 9
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %0, i64 %140
  store double %136, double addrspace(1)* %141, align 8, !tbaa !11
  %142 = add nsw i32 %139, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %0, i64 %143
  store double %110, double addrspace(1)* %144, align 8, !tbaa !11
  %145 = add nsw i32 %139, 2
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %0, i64 %146
  store double %114, double addrspace(1)* %147, align 8, !tbaa !11
  %148 = add nsw i32 %139, 3
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  store double %118, double addrspace(1)* %150, align 8, !tbaa !11
  %151 = add nsw i32 %139, 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %0, i64 %152
  store double %137, double addrspace(1)* %153, align 8, !tbaa !11
  %154 = add nsw i32 %139, 5
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %0, i64 %155
  store double %124, double addrspace(1)* %156, align 8, !tbaa !11
  %157 = add nsw i32 %139, 6
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds double, double addrspace(1)* %0, i64 %158
  store double %128, double addrspace(1)* %159, align 8, !tbaa !11
  %160 = add nsw i32 %139, 7
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %0, i64 %161
  store double %132, double addrspace(1)* %162, align 8, !tbaa !11
  %163 = add nsw i32 %139, 8
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double, double addrspace(1)* %0, i64 %164
  store double %138, double addrspace(1)* %165, align 8, !tbaa !11
  br label %166

166:                                              ; preds = %10, %3
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !7, i64 0}
