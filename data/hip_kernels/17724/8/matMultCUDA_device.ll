; ModuleID = '../data/hip_kernels/17724/8/main.cu'
source_filename = "../data/hip_kernels/17724/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11matMultCUDAPKfiS0_iPfiiE4matA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ11matMultCUDAPKfiS0_iPfiiE4matB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11matMultCUDAPKfiS0_iPfii(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 4
  %14 = icmp sgt i32 %6, 0
  %15 = add nsw i32 %13, %9
  br i1 %14, label %18, label %16

16:                                               ; preds = %7
  %17 = add i32 %11, %8
  br label %184

18:                                               ; preds = %7
  %19 = mul nsw i32 %15, %1
  %20 = add nsw i32 %19, %8
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 %8
  %22 = add i32 %11, %8
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 %9, i32 %8
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 0
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 0, i32 %8
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 1
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 1, i32 %8
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 2
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 2, i32 %8
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 3
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 3, i32 %8
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 4
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 4, i32 %8
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 5
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 5, i32 %8
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 6
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 6, i32 %8
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 7
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 7, i32 %8
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 8, i32 %8
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 9, i32 %8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 10
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 10, i32 %8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 11
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 11, i32 %8
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 12
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 12, i32 %8
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 13
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 13, i32 %8
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 14
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 14, i32 %8
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matA, i32 0, i32 %9, i32 15
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ11matMultCUDAPKfiS0_iPfiiE4matB, i32 0, i32 15, i32 %8
  br label %56

56:                                               ; preds = %18, %56
  %57 = phi float [ 0.000000e+00, %18 ], [ %181, %56 ]
  %58 = phi float [ 0.000000e+00, %18 ], [ %179, %56 ]
  %59 = phi i32 [ 0, %18 ], [ %182, %56 ]
  %60 = add nsw i32 %20, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %63, float addrspace(3)* %21, align 4, !tbaa !5
  %64 = add nuw nsw i32 %59, %9
  %65 = mul nsw i32 %64, %3
  %66 = add i32 %22, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %69, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %71 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %72 = fmul contract float %70, %71
  %73 = fsub contract float %57, %72
  %74 = fsub contract float %58, %73
  %75 = fsub contract float %74, %58
  %76 = fadd contract float %73, %75
  %77 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %79 = fmul contract float %77, %78
  %80 = fsub contract float %76, %79
  %81 = fsub contract float %74, %80
  %82 = fsub contract float %81, %74
  %83 = fadd contract float %80, %82
  %84 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %85 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %86 = fmul contract float %84, %85
  %87 = fsub contract float %83, %86
  %88 = fsub contract float %81, %87
  %89 = fsub contract float %88, %81
  %90 = fadd contract float %87, %89
  %91 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %93 = fmul contract float %91, %92
  %94 = fsub contract float %90, %93
  %95 = fsub contract float %88, %94
  %96 = fsub contract float %95, %88
  %97 = fadd contract float %94, %96
  %98 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %99 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %100 = fmul contract float %98, %99
  %101 = fsub contract float %97, %100
  %102 = fsub contract float %95, %101
  %103 = fsub contract float %102, %95
  %104 = fadd contract float %101, %103
  %105 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %106 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fsub contract float %104, %107
  %109 = fsub contract float %102, %108
  %110 = fsub contract float %109, %102
  %111 = fadd contract float %108, %110
  %112 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %113 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fsub contract float %111, %114
  %116 = fsub contract float %109, %115
  %117 = fsub contract float %116, %109
  %118 = fadd contract float %115, %117
  %119 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %120 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %121 = fmul contract float %119, %120
  %122 = fsub contract float %118, %121
  %123 = fsub contract float %116, %122
  %124 = fsub contract float %123, %116
  %125 = fadd contract float %122, %124
  %126 = load float, float addrspace(3)* %40, align 16, !tbaa !5
  %127 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fsub contract float %125, %128
  %130 = fsub contract float %123, %129
  %131 = fsub contract float %130, %123
  %132 = fadd contract float %129, %131
  %133 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fsub contract float %132, %135
  %137 = fsub contract float %130, %136
  %138 = fsub contract float %137, %130
  %139 = fadd contract float %136, %138
  %140 = load float, float addrspace(3)* %44, align 8, !tbaa !5
  %141 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fsub contract float %139, %142
  %144 = fsub contract float %137, %143
  %145 = fsub contract float %144, %137
  %146 = fadd contract float %143, %145
  %147 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %148 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %149 = fmul contract float %147, %148
  %150 = fsub contract float %146, %149
  %151 = fsub contract float %144, %150
  %152 = fsub contract float %151, %144
  %153 = fadd contract float %150, %152
  %154 = load float, float addrspace(3)* %48, align 16, !tbaa !5
  %155 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %156 = fmul contract float %154, %155
  %157 = fsub contract float %153, %156
  %158 = fsub contract float %151, %157
  %159 = fsub contract float %158, %151
  %160 = fadd contract float %157, %159
  %161 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %162 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %163 = fmul contract float %161, %162
  %164 = fsub contract float %160, %163
  %165 = fsub contract float %158, %164
  %166 = fsub contract float %165, %158
  %167 = fadd contract float %164, %166
  %168 = load float, float addrspace(3)* %52, align 8, !tbaa !5
  %169 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %170 = fmul contract float %168, %169
  %171 = fsub contract float %167, %170
  %172 = fsub contract float %165, %171
  %173 = fsub contract float %172, %165
  %174 = fadd contract float %171, %173
  %175 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %176 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %177 = fmul contract float %175, %176
  %178 = fsub contract float %174, %177
  %179 = fsub contract float %172, %178
  %180 = fsub contract float %179, %172
  %181 = fadd contract float %178, %180
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %182 = add nuw nsw i32 %59, 16
  %183 = icmp slt i32 %182, %6
  br i1 %183, label %56, label %184, !llvm.loop !10

184:                                              ; preds = %56, %16
  %185 = phi i32 [ %17, %16 ], [ %22, %56 ]
  %186 = phi float [ 0.000000e+00, %16 ], [ %179, %56 ]
  %187 = mul nsw i32 %15, %5
  %188 = add i32 %185, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %4, i64 %189
  store float %186, float addrspace(1)* %190, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
